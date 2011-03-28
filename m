From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 28 Mar 2011 09:59:39 +0200
Subject: [Buildroot] [PATCH] readline: link directly against ncurses
In-Reply-To: <AANLkTinDM3AY4iA5gipkrUHEc7EoMO6-VMLOb_NpsVkG@mail.gmail.com>
	(Mike Frysinger's message of "Mon, 28 Mar 2011 03:36:46 -0400")
References: <1300923775-13739-1-git-send-email-vapier@gentoo.org>
	<20110324194745.268213ba@surf>
	<AANLkTinDM3AY4iA5gipkrUHEc7EoMO6-VMLOb_NpsVkG@mail.gmail.com>
Message-ID: <87fwq7vfo4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> On Thu, Mar 24, 2011 at 2:47 PM, Thomas Petazzoni wrote:
 >> On Wed, 23 Mar 2011 19:42:55 -0400 Mike Frysinger wrote:
 >>> note: not really tested since external toolchain support is totally
 >>> broken
 >> 
 >> Could you elaborate ?

 Mike> i'm pretty sure i pointed this out around the time it broke.  if you
 Mike> dont specify the full path, the stupid makefiles prepend garbage.

 Mike> BR2_TOOLCHAIN_EXTERNAL=y
 Mike> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 Mike> BR2_TOOLCHAIN_EXTERNAL_PATH=""
 Mike> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="bfin-uclinux"
 Mike> BR2_TOOLCHAIN_EXTERNAL_PREFIX="bfin-uclinux"

Ahh, that got reported some time ago:

http://lists.busybox.net/pipermail/buildroot/2011-March/041891.html

I'll fix it now.

-- 
Bye, Peter Korsgaard
