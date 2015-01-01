From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 2 Jan 2015 00:21:23 +0100
Subject: [Buildroot] [PATCH 2/7] linux: add option to rely on a
 bootloader-provided DTB
In-Reply-To: <87k3169joz.fsf@dell.be.48ers.dk>
References: <cover.1420142707.git.yann.morin.1998@free.fr>
 <e330f5c885f762feb6f4d7487fe3f6aa29c7fca3.1420142707.git.yann.morin.1998@free.fr>
 <20150101222449.18453adb@free-electrons.com>
 <20150101214435.GJ4360@free.fr>
 <20150101225102.64944ac5@free-electrons.com>
 <20150101215845.GK4360@free.fr>
 <20150101231700.75d142fd@free-electrons.com>
 <87k3169joz.fsf@dell.be.48ers.dk>
Message-ID: <20150101232123.GO4360@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Thomas, All,

On 2015-01-02 00:15 +0100, Peter Korsgaard spake thusly:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>  > Dear Yann E. MORIN,
>  > On Thu, 1 Jan 2015 22:58:45 +0100, Yann E. MORIN wrote:
> 
>  >> However, I beg to disagree on that last part: I think we should have
>  >> this as an option in Buildroot.
>  >> 
>  >> The reason is that some platforms can be built with or without support
>  >> for the device tree. The Raspberry Pi is but one such platform; there
>  >> are others. Their defconfig do not always enable USE_OF by default, it
>  >> must be a volunteer selection from the user.
>  >> 
>  >> In that case, your opinion is to delegate to the user the responsibility
>  >> to enable that on his own, right? So, it would no longer be possible to
>  >> use in-tree defconfigs for those boards, for example.
> 
>  > Well, to me this is a slippery slope. There are gazillions of kernel
>  > options that do platform-specific stuff. So far, we really tried hard
>  > to limit how much Buildroot modifies the kernel options, and tried to
>  > limit that to cases related to userspace components enabled by the user
>  > that really need some feature in the kernel.
> 
>  > Let's see what Peter thinks about this, he might very well have a
>  > different opinion on this.
> 
> I must say I'm with Thomas on this one. Let's not fiddle with the kernel
> .config unless we really _HAVE_ to.

OK, marked as Rejected in Patchwork, dropped from my tree.

Thamks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
