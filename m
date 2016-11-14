From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 14 Nov 2016 22:26:13 +0100
Subject: [Buildroot] [PATCH v1 2/2] openjpeg: fix static linking of
 liblcms2
In-Reply-To: <20161113143415.611cb424@free-electrons.com>
References: <1478904851-21040-1-git-send-email-ps.report@gmx.net>
 <1478904851-21040-2-git-send-email-ps.report@gmx.net>
 <20161113143415.611cb424@free-electrons.com>
Message-ID: <20161114222613.7de92b26@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sun, 13 Nov 2016 14:34:15 +0100, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Fri, 11 Nov 2016 23:54:11 +0100, Peter Seiderer wrote:
> > Fixes [1]:
> > 
> >   .../host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/liblcms2.a(cmsplugin.o): In function `_cmsDeleteContext':
> >   cmsplugin.c:(.text+0x1c2): undefined reference to `_pthread_mutex_lock'
> >   cmsplugin.c:(.text+0x1f6): undefined reference to `_pthread_mutex_unlock'
> > 
> > http://autobuild.buildroot.net/results/5ce/5cee20afd8bef5268832cddcb3a5270746be7a57
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> > Depends on [2] from Samuel Martin.
> 
> Applied to master, thanks. Also, please submit the patch upstream.

O.k, done [1] ...

Regards,
Peter

[1] https://github.com/uclouvain/openjpeg/pull/867

> Thanks!
> 
> Thomas
