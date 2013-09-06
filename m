From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Sep 2013 16:35:51 +0200
Subject: [Buildroot] [git commit] uclibc: add upstream 0.9.33 fixes
In-Reply-To: <20130906133535.2BD969A98A@busybox.osuosl.org>
References: <20130906133535.2BD969A98A@busybox.osuosl.org>
Message-ID: <20130906163551.571faf5c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Fri, 6 Sep 2013 15:28:51 +0200, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=055f1c02d35068d0b089f3b29ffdd4fb2717bb5c
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Upstream has a large number of patches lined up for the next 0.9.33.x bugfix
> release;
> 
> http://git.uclibc.org/uClibc/log/?h=0.9.33
> 
> Add them here, as atleast some of them are quite critical (E.G. the eventfd
> issue gets triggered by recent glib versions).
> 
> I've skipped the microblaze and xtensa fixes as we don't currently support
> those with 0.9.33.2.
> 
> Drop uclibc-0002-Add-definition-of-MSG_WAITFORONE-and-MSG_CMSG_CMSG_CLOEXE.patch
> as that is a subset of uclibc-0035-socket.h-pull-socket_type.h-from-eglibc.patch

Shouldn't we switch to using the git version of uClibc instead of
carrying 40+ patches? The uClibc project seems to have issues getting
releases out, maybe we should just use their git version, and bump it
from time to time when appropriate?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
