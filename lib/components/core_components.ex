case Code.ensure_loaded(Phoenix.Component) do
  {:error, _} ->
    nil

  _ ->
    defmodule Rumble.Oauth2.Components.Core do
      use Phoenix.Component

      @doc """
      Generates Rumble Login Button.
        ## Examples

         <.login_button  />
      """
      attr(:width, :any, required: false, default: "24")
      attr(:height, :any, required: false, default: "24")
      attr(:style, :any, required: false, default: "display:flex;")
      attr(:title, :any, required: false, default: "Rumble")
      attr(:url, :any, required: false, default: "/")
      attr(:class, :any, required: false, default: "rumble_login_button")
      attr(:a_class, :any, required: false, default: "rumble_login_button")
      attr(:fill, :any, required: false, default: "white")
      attr(:fill_rule, :any, required: false, default: "evenodd")
      attr(:clip_rule, :any, required: false, default: "evenodd")

      attr(:d, :any,
        required: false,
        default:
          "M13.9407 13.552C14.9078 12.8107 14.9076 11.3754 13.9503 10.6212C12.5312 9.50328 11.0086 8.56384 9.44808 7.85124C8.33744 7.34409 7.0933 8.05037 6.91567 9.26688C6.64424 11.1258 6.59108 12.9903 6.76686 14.7691C6.8876 15.9909 8.11489 16.7249 9.24162 16.2599C10.9239 15.5656 12.4955 14.6598 13.9407 13.552ZM21.172 8.14513C23.2938 10.344 23.3033 13.8104 21.1903 16.018C17.4436 19.9325 12.7827 22.6027 7.51803 23.8477C4.75367 24.5015 1.9257 23.0024 1.08811 20.2661C-0.502708 15.0692 -0.269092 9.19062 1.26818 3.96569C2.07579 1.22073 4.7679 -0.503223 7.53615 0.131601C12.6674 1.30833 17.486 4.32521 21.172 8.14513Z"
      )

      def login_button(assigns) do
        ~H"""
        <div class="{@class}" style="{@style}">
        <a href="{@url}" class="{@a_class}">
        <svg width="{@width}" height="{@height}" viewBox="0 0 {@width} {@height}" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path fill-rule="{@fill_rule}" clip-rule="{@clip_rule}" d="{@d}" fill="{@fill}"></path>
        </svg>
        {@title}
        </a>
        </div>
        """
      end
    end
end
