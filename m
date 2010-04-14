From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 14 Apr 2010 19:38:00 +0300
Subject: [Buildroot] Problems with i686_defconfig
In-Reply-To: <4BC59A02.40804@carallon.com>
References: <4BC59A02.40804@carallon.com>
Message-ID: <20100414163800.GD2212@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Will,

On Wed, Apr 14, 2010 at 11:33:38AM +0100, Will Wagner wrote:
> Finally the build fails in either gdbserver (if selected) or
> busybox, complaining the symbol usleep is undefined. Anyone seen
> this before? Is it some config problem with uClibc 0.9.31?

usleep() is not available when UCLIBC_SUSV3_LEGACY is disabled. See 
http://lists.busybox.net/pipermail/busybox/2010-April/072031.html.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
