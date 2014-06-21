#jewel module Jewel

# ---------------
# Global Commands
# ---------------

handle("julia.set-global-client") do req, data
  global global_client = req[1]
end

function command(cmd, data = Dict())
  data[:cmd] = cmd
  raise(global_client, "editor.eval.julia.command", data)
end

function popup(header, body="", buttons = [{:label => "Ok"}])
  command("popup",
          [:header => header,
           :body => body,
           :buttons => buttons])
end

function ltprint(message; error = false)
  command("print",
          [:value => message,
           :error => error])
end

function notify_done(msg = nothing)
  command("done", {:msg => msg})
end

function notify(message; class = "")
  command("notify",
          {:msg => message,
           :class => class})
end

function console(value::String; html = false)
  command("console",
          {"value" => value,
           "html"  => html})
end