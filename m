From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sat,  9 Oct 2010 12:52:47 +0200
Subject: [Buildroot] [pull request] libtool enhancement v2
Message-ID: <1286621574-10872-1-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a second version of a patch set mostly from Martin Banky to
support libtool patching depending on the libtool script version. This
also bumps libtool to version 2.2.10, so we can autoreconfigure
packages depending on libtool 2.2 versions (gtk+, glib, etc...).

You can pull from :
    git://git.potipota.net/buildroot martins-libtool

Regards,

--
Lionel Landwerlin
