From: Jacek Kryszyn <jkryszyn@gmail.com>
Date: Thu, 28 Jan 2021 23:04:30 +0100
Subject: [Buildroot] Adding Lua libraries in a config file
Message-ID: <CAGYgDB0DRjrRXT4wT3qrucgu5zU=HTJ8SwZ02SvHij_1nG1thQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I would like to add some Lua libraries to my build. I already have some,
i.e.:

BR2_PACKAGE_LUA=y
BR2_PACKAGE_LUA_CJSON=y
BR2_PACKAGE_LUA_CURL=y
BR2_PACKAGE_LUAPOSIX=y

but I would like to have luamqtt as well. Is it possible via definition in
a config file? Or can I do it some other way?
Best regards
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210128/5b48bd27/attachment.html>
