From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Fri,  8 Oct 2010 08:55:02 +0200
Subject: [Buildroot] [pull request] libtool enhancement
Message-ID: <1286520909-3436-1-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a patch set mostly from Martin Banky to support libtool
patching depending on the libtool script version. This also bumps
libtool to version 2.2.10, so we can autoreconfigure packages
depending on libtool 2.2 versions (gtk+, glib, etc...).

You can pull from :
    git://git.potipota.net/buildroot martins-libtool

Regards,

--
Lionel Landwerlin
