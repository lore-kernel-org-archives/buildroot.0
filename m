From: vano <ivan.kuten@promwad.com>
Date: Tue, 25 Sep 2007 14:01:54 -0100
Subject: [Buildroot] svn commit: trunk/buildroot/package: alsa-utils
 dialog directfb fbv freetype etc...
In-Reply-To: <20070925123411.EA7E03006B@busybox.net>
References: <20070925123411.EA7E03006B@busybox.net>
Message-ID: <46F922E2.6020702@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard,

Is it possible for you to convert one of packages to use
AUTOTARGETS approach? This would allow transition of all
packages to AUTOTARGETS and thus no need to "rm -f config.cache;" in
every *.mk file , but the single change to Makefile.autotools.in

As I understand the usages of AUTOTARGETS is preferred way of handling
new packages? Or I am not right?

Best regards,
Ivan


aldot at uclibc.org wrote:
> Author: aldot
> Date: 2007-09-25 05:34:09 -0700 (Tue, 25 Sep 2007)
> New Revision: 20016
> 
> Log:
> - make sure that configure doesn't see a wrong cache
> 
> 
> Modified:
>    trunk/buildroot/package/alsa-utils/alsa-utils.mk
>    trunk/buildroot/package/dialog/dialog.mk
>    trunk/buildroot/package/directfb/directfb.mk
>    trunk/buildroot/package/fbv/fbv.mk
>    trunk/buildroot/package/freetype/freetype.mk
>    trunk/buildroot/package/imagemagick/imagemagick.mk
