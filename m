From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 Nov 2014 19:00:34 +0100
Subject: [Buildroot] [PATCH] Add a defconfig for MIPS Creator CI20
In-Reply-To: <54774A7F.5010507@zacarias.com.ar>
References: <1417100707-23700-1-git-send-email-Vincent.Riera@imgtec.com>
 <87y4qwoeiv.fsf@dell.be.48ers.dk>
 <54774A7F.5010507@zacarias.com.ar>
Message-ID: <20141127180034.GD3900@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2014-11-27 12:59 -0300, Gustavo Zacarias spake thusly:
> On 11/27/2014 12:21 PM, Peter Korsgaard wrote:
> 
> >  > +++ b/configs/ci20_defconfig
> >  > @@ -0,0 +1,10 @@
> >  > +BR2_mipsel=y
> >  > +BR2_mips_32r2=y
> >  > +# BR2_MIPS_SOFT_FLOAT is not set
> >  > +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> >  > +BR2_TARGET_GENERIC_GETTY_PORT="ttyS4"
> >  > +BR2_LINUX_KERNEL=y
> >  > +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> >  > +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/MIPS/CI20_linux.git"
> >  > +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="ci20-v3.0.8"
> > 
> > Thanks, but this is a branch, not a tag - Right?
> > 
> > To have a reproducable build, we should select a tag or a specific sha1.
> > 
> > What about u-boot and perhaps a readme about how to use it?
> 
> Also lock-down the kernel headers version please, i doubt things will be
> too happy with a (likely) 3.0.x kernel and 3.18 (soon) headers.

And use https:// instead of git:// for those behind unfrioendly firewalls. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
