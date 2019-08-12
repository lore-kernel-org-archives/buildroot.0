From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 12 Aug 2019 14:44:32 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2019-08-11
In-Reply-To: <CAJ4jsac9bV+WqVU8tXggZvqUtJt+7NEjX=GC9QUKE_vwhLLSEA@mail.gmail.com>
References: <20190812061658.7E800203B2@silver.osuosl.org>
 <CAJ4jsac9bV+WqVU8tXggZvqUtJt+7NEjX=GC9QUKE_vwhLLSEA@mail.gmail.com>
Message-ID: <20190812114432.4ykdeooxvy2e2qsx@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlos,

On Mon, Aug 12, 2019 at 08:41:01AM -0300, Carlos Santos wrote:
> On Mon, Aug 12, 2019 at 3:17 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> 
> > Results for branch 'master'
> > ===========================
> >
> > Classification of failures by reason
> [...]
> >                util-linux-2.34 | 1
> [...]
> > Detail of failures
> > ------------------
> >
> >     arch     |             reason             | OK? |                                       url                                       | orph?
> > -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
> >     arm      |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/b70df12ac7e8c5d951507c326b16ac0615b2024b |
> 
> "ERROR: No hash found for util-linux-2.34.tar.xz"
> gitid: 29186f8c832f682b2664bcf9a33551e4b7f05425
> 
> This does not make sense. There is no commit
> 29186f8c832f682b2664bcf9a33551e4b7f05425 in branch "master". It's in
> 2019.05.x. Also, the util-linux version at that point is 2.33:
> 
> $ git checkout 29186f8c832f682b2664bcf9a33551e4b7f05425
> Note: checking out '29186f8c832f682b2664bcf9a33551e4b7f05425'.
> $ head package/util-linux/util-linux.mk
> ################################################################################
> #
> # util-linux
> #
> ################################################################################
> 
> UTIL_LINUX_VERSION_MAJOR = 2.33
> UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
> UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
> UTIL_LINUX_SITE =
> $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)

This is from gcc160. See 
http://lists.busybox.net/pipermail/buildroot/2019-August/256871.html .

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
