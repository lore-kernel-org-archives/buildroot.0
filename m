From: =?UTF-8?q?Arnaud=20R=C3=A9billout?= <rebillout@syscom.ch>
Date: Tue, 25 Mar 2014 08:59:55 +0100
Subject: [Buildroot] [PATCH 0/1] dbus-triggerd, a helpful little daemon
Message-ID: <1395734396-31668-1-git-send-email-rebillout@syscom.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

let me introduce you to dbus-triggerd.

dbus-triggerd is a little daemon that can monitor dbus events, match
them against some watch-expressions, then trigger shell-commands.

The code is really small and neat, the only dependency is dbus.
Furthermore, it comes with a manual page !

I find it especially useful in automated test scripts, but it can be
used in any situation where dbus-interaction is needed, and shell script
is preferred over other languages.

If anybody find it useful, here comes a patch to add this package to buildroot.

Regards,

-- 
Arnaud R?billout
