From: Steven Woody <narkewoody@gmail.com>
Date: Sun, 31 Aug 2008 15:34:46 +0800
Subject: [Buildroot] Make error
In-Reply-To: <87od3966tr.fsf@macbook.be.48ers.dk>
References: <ed4892840808301750t13e320a6ne218b2a0e96168f@mail.gmail.com>
	<87od3966tr.fsf@macbook.be.48ers.dk>
Message-ID: <ed4892840808310034y2b352388q9dd2ff90a614ee13@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Aug 31, 2008 at 2:23 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Steven" == Steven Woody <narkewoody@gmail.com> writes:
>
>  Steven> Following were outputed when run 'make', but I don't know
>  Steven> what step it is related to:
>
>  Steven> table='target/generic/mini_device_table.txt' makedevs: line
>  Steven> 53: regular file
>  Steven> '/home/narke/buildroot/project_build_arm/uclibc/
>  Steven> root/usr/share/udhcpc/default.script' does not exist: No such
>  Steven> file or directory
>
> Not a big deal. The mini config you have selected
> (BR2_PACKAGE_BUSYBOX_SKELETON) has the udhcpc script listed in its
> device table to ensure it gets to be executable, but doesn't have a
> default script. If you don't enable avahi (which provides such a
> script) you'll get this warning.
>
> The avahi package nowadays ensures that it's udhcpc script gets to be
> executable, so I'll remove the entry from the device table.

So much thanks!
