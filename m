From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 16 Aug 2013 12:24:25 +0200
Subject: [Buildroot] [PATCH] targets: move target options to their own
	sub-menu
In-Reply-To: <201308160839.05082.yann.morin.1998@free.fr>
References: <1376598482-9492-1-git-send-email-yann.morin.1998@free.fr>
 <520D5FE6.2090007@mind.be>
 <CAAXf6LV8gfZUmLogOubg5j03d9HJR7-bm+cm+HDG-N6kNAiK_g@mail.gmail.com>
 <201308160839.05082.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LXZ3vzUfexiNiGZu-c-chMZ0rKOpGs=N9APmTO_Y63wRg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 16, 2013 at 8:39 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas, Arnout, All,
>
> On Friday 16 August 2013 08:30:43 Thomas De Schampheleire wrote:
>> On Fri, Aug 16, 2013 at 1:10 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> > On 15/08/13 22:28, Yann E. MORIN wrote:
>> >>
> I would even put the kernel before the packages, and bootloaders before
> kernel. Ie. I'd use the boot-time order of things:
>     (Target options)
>     Build options
>     Toolchain
>     System configuration
>     Bootloaders
>     Kernel
>     Packages selection
>     Filesystem images
>     Host Utilities
>     Legacy config options
>
> Bizzarely enough, moving bootloaders before kernel seems odd... :-/


I can follow this boot-time order strategy, but I concur with the
bootloader odditi.
