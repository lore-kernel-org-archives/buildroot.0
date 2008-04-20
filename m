From: Arun Reddy <reddyac@gmail.com>
Date: Sat, 19 Apr 2008 20:12:23 -0700
Subject: [Buildroot] Buildroot for AT91RM9200EK?
In-Reply-To: <844460.38324.qm@web31807.mail.mud.yahoo.com>
References: <118206.91133.qm@web31803.mail.mud.yahoo.com>
	<844460.38324.qm@web31807.mail.mud.yahoo.com>
Message-ID: <326f33790804192012obfa723aof17a9716b815012b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Pink Boy,

While I am uncertain why uImage is not appearing in the source folder,

*"I'm wondering
is there is either an option I'm not setting, the current source
is broken and I need to use an older one, or there is some patch
I need."*

to solve the problem of retrieving the older source, cannot you simply
modify the .mk file and manually change the source file that is currently
listed to an older, available one?

Arun

On Sat, Apr 19, 2008 at 7:42 PM, Pink Boy <dasfoo@yahoo.com> wrote:

> Hi,
>
> One more thing, the command that seems to bomb,
>
>
> cp -pf
> /home/tu/workspace/arm920_tool/buildroot/project_build_arm/uclibc/linux-2.6.22.1/arch/arm/boot/uImage
>
> /home/tu/workspace/arm920_tool/buildroot/binaries/uclibc/at91rm9200ek-linux-2.6.22.1-20080420.gz
>
> The is no uImage in the source folder, there is however a zImage.
>
> ???
>
> Mr Foo
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080419/ed74fbcc/attachment.htm 
