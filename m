From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Jul 2012 17:31:44 +0200
Subject: [Buildroot] [PATCH] curlftpfs: new package
In-Reply-To: <1342884438-5325-1-git-send-email-rbraun@sceen.net>
References: <1342884438-5325-1-git-send-email-rbraun@sceen.net>
Message-ID: <20120721173144.1f50021f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 21 Jul 2012 17:27:18 +0200,
Richard Braun <rbraun@sceen.net> a ?crit :

> @@ -169,6 +169,7 @@ menu "Hardware handling"
>  source "package/acpid/Config.in"
>  source "package/cdrkit/Config.in"
>  source "package/cramfs/Config.in"
> +source "package/curlftpfs/Config.in"
>  source "package/dbus/Config.in"
>  source "package/dbus-glib/Config.in"
>  source "package/dbus-python/Config.in"

This "Hardware handling" menu is becoming quite crazy. curlftpfs
clearly has nothing to do with Hardware handling (and many other things
in there).

Even "cramfs" for example is not quite Hardware handling related. Maybe
we should put more things in the "System tools" menu, or create a
"Filesystems tools" menu or something. Suggestions welcome.

Otherwise, looks good.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
