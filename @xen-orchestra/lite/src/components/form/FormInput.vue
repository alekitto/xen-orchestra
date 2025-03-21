<template>
  <span :class="wrapperClass" v-bind="wrapperAttrs">
    <input
      v-if="!isSelect"
      v-model="value"
      :class="inputClass"
      :disabled="disabled || isLabelDisabled"
      class="input"
      v-bind="$attrs"
    />
    <template v-else>
      <select
        v-model="value"
        :class="inputClass"
        :disabled="disabled || isLabelDisabled"
        class="select"
        v-bind="$attrs"
      >
        <slot />
      </select>
      <span class="caret">
        <UiIcon :fixed-width="false" :icon="faAngleDown" />
      </span>
    </template>
    <span v-if="before !== undefined" class="before">
      <template v-if="typeof before === 'string'">{{ before }}</template>
      <UiIcon v-else :icon="before" class="before" />
    </span>
    <span v-if="after !== undefined" class="after">
      <template v-if="typeof after === 'string'">{{ after }}</template>
      <UiIcon v-else :icon="after" class="after" />
    </span>
  </span>
</template>

<script lang="ts">
export default {
  name: "FormInput",
  inheritAttrs: false,
};
</script>

<script lang="ts" setup>
import { isEmpty } from "lodash-es";
import {
  type HTMLAttributes,
  type InputHTMLAttributes,
  computed,
  inject,
  ref,
} from "vue";
import type { Color } from "@/types";
import type { IconDefinition } from "@fortawesome/fontawesome-common-types";
import { faAngleDown } from "@fortawesome/free-solid-svg-icons";
import { useVModel } from "@vueuse/core";
import UiIcon from "@/components/ui/UiIcon.vue";

// Temporary workaround for https://github.com/vuejs/core/issues/4294
interface Props extends Omit<InputHTMLAttributes, ""> {
  modelValue?: unknown;
  color?: Color;
  before?: Omit<IconDefinition, ""> | string;
  after?: Omit<IconDefinition, ""> | string;
  beforeWidth?: string;
  afterWidth?: string;
  disabled?: boolean;
  right?: boolean;
  wrapperAttrs?: HTMLAttributes;
}

const props = withDefaults(defineProps<Props>(), { color: "info" });

const emit = defineEmits<{
  (event: "update:modelValue", value: any): void;
}>();

const value = useVModel(props, "modelValue", emit);
const empty = computed(() => isEmpty(props.modelValue));
const isSelect = inject("isSelect", false);
const isLabelDisabled = inject("isLabelDisabled", ref(false));

const wrapperClass = computed(() => [
  isSelect ? "form-select" : "form-input",
  {
    disabled: props.disabled || isLabelDisabled.value,
    empty: empty.value,
  },
]);

const inputClass = computed(() => [
  props.color,
  {
    right: props.right,
    "has-before": props.before !== undefined,
    "has-after": props.after !== undefined,
  },
]);
</script>

<style lang="postcss" scoped>
.form-input,
.form-select {
  display: inline-grid;
  align-items: stretch;

  --before-width: v-bind('beforeWidth ?? "1.75em"');
  --after-width: v-bind('afterWidth ?? "1.625em"');
  --caret-width: 1.5em;

  --text-color: var(--color-blue-scale-100);

  &.empty {
    --text-color: var(--color-blue-scale-300);
  }

  &.disabled {
    --text-color: var(--color-blue-scale-400);
  }
}

.form-input {
  grid-template-columns: var(--before-width) auto var(--after-width);
}

.form-select {
  grid-template-columns:
    var(--before-width)
    auto
    var(--after-width)
    var(--caret-width);
}

.input,
.select {
  font-size: 1em;
  height: 2em;
  margin: 0;
  color: var(--text-color);
  border: 0.0625em solid var(--border-color);
  border-radius: 0.5em;
  outline: none;
  background-color: var(--background-color);
  box-shadow: var(--shadow-100);
  grid-row: 1 / 2;
  grid-column: 1 / 4;

  &.right {
    text-align: right;
  }

  --background-color: var(--background-color-primary);
  --border-color: var(--color-blue-scale-400);

  &:disabled {
    cursor: not-allowed;
    --background-color: var(--background-color-secondary);
  }

  &:not(:disabled) {
    &.info {
      &:hover {
        --border-color: var(--color-extra-blue-l60);
      }

      &:active {
        --border-color: var(--color-extra-blue-l40);
      }

      &:focus {
        --border-color: var(--color-extra-blue-base);
      }
    }

    &.success {
      --border-color: var(--color-green-infra-base);

      &:hover {
        --border-color: var(--color-green-infra-l60);
      }

      &:active {
        --border-color: var(--color-green-infra-l40);
      }

      &:focus {
        --border-color: var(--color-green-infra-base);
      }
    }

    &.warning {
      --border-color: var(--color-orange-world-base);

      &:hover {
        --border-color: var(--color-orange-world-l60);
      }

      &:active {
        --border-color: var(--color-orange-world-l40);
      }

      &:focus {
        --border-color: var(--color-orange-world-base);
      }
    }

    &.error {
      --border-color: var(--color-red-vates-base);

      &:hover {
        --border-color: var(--color-red-vates-l60);
      }

      &:active {
        --border-color: var(--color-red-vates-l40);
      }

      &:focus-within {
        --border-color: var(--color-red-vates-base);
      }
    }
  }
}

.input {
  padding: 0 0.625em 0 0.625em;

  &.has-before {
    padding-left: calc(var(--before-width) + 0.25em);
  }

  &.has-after {
    padding-right: calc(var(--after-width) + 0.25em);
  }
}

.select {
  min-width: fit-content;
  padding: 0 calc(var(--caret-width) + 0.25em) 0 0.625em;
  grid-column: 1 / 5;
  appearance: none;

  &.has-before {
    padding-left: calc(var(--before-width) + 0.25em);
  }

  &.has-after {
    padding-right: calc(var(--after-width) + 0.25em + var(--caret-width));
  }
}

.before,
.after,
.caret {
  display: inline-flex;
  align-items: center;
  pointer-events: none;
  color: var(--text-color);
  grid-row: 1 / 2;
}

.before {
  justify-self: end;
  grid-column: 1 / 2;
}

.after {
  justify-self: start;
  grid-column: 3 / 4;
}

.caret {
  justify-self: start;
  grid-column: 4 / 5;
}
</style>
