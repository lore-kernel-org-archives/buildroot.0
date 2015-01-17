From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 18 Jan 2015 00:32:46 +0200
Subject: [Buildroot] [PATCH 1/1] configs/udoo_quad_defconfig: new
 defconfig
In-Reply-To: <1421533112-5265-1-git-send-email-ivo.slanina@gmail.com>
References: <1421533112-5265-1-git-send-email-ivo.slanina@gmail.com>
Message-ID: <20150117223246.GH2827@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ivo,

On Sat, Jan 17, 2015 at 11:18:32PM +0100, Ivo Slanina wrote:
> Added defconfig for UDOO Quad board. Used official kernel 3.0.35.
> Kernel is patched in order to use gcc version 4.8 and above,
> according to mailing list at
> https://lists.yoctoproject.org/pipermail/meta-freescale/2013-July/003531.html

Why can't you use mainline kernel for this board?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
