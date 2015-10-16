From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 16 Oct 2015 20:31:26 +0200
Subject: [Buildroot] [PATCH v1] libv4l: fix missing libintl linking
In-Reply-To: <20151016001305.082b5c06@free-electrons.com>
References: <1444943175-9000-1-git-send-email-ps.report@gmx.net>
 <20151016001305.082b5c06@free-electrons.com>
Message-ID: <20151016203126.38efb8eb@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Fri, 16 Oct 2015 00:13:05 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Dear Peter Seiderer,
> 
> On Thu, 15 Oct 2015 23:06:15 +0200, Peter Seiderer wrote:
> > Add missing libintl linking to utils/dvb and utils/keytable (patch
> > Makefile.in because patching Makefile.am and autoreconf did not work).
> 
> Please patch Makefile.am. To make autoreconf work on this package,
> simply add host-gettext to LIBV4L_DEPENDENCIES.

This was the missing part, thanks for the tip...

> 
> Then, submit the patch upstream, so that it gets integrated and we can
> get rid of it at the next upstream release.
>

Done, see [1], updated buildroot patch follows...

Regards,
Peter


[1]  http://permalink.gmane.org/gmane.linux.drivers.video-input-infrastructure/95883

> Thanks a lot!
> 
> Thomas
