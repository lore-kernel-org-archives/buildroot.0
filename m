From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 9 Oct 2012 18:33:14 +0200
Subject: [Buildroot] Error when building defconfig
In-Reply-To: <87haq3ag09.fsf@macbook.be.48ers.dk>
References: <CAGduivwG505TRkZ8SnD_MXcyuF6qWwLPoc3CTnZtE5HZ2Uwv0w@mail.gmail.com>
 <87haq3ag09.fsf@macbook.be.48ers.dk>
Message-ID: <CAGduivzxOWXOOMhadjQFi5Qp0vN5Q3_Ud7BLQ+iaC2nyWA6fxA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 9, 2012 at 4:15 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:
>
>  Maxime> Hi,
>
>  Maxime> I'm using the HEAD of the git tree of buildroot, and I just
>  Maxime> tried to build a "default" config. I did : $ cp
>  Maxime> ./configs/qemu_x86_defconfig .config && make
>
>  Maxime> The menuconfig appeared, I saved the conf and exited. I did not
>  Maxime> change any option myself. Then I tried to make again, after a
>  Maxime> short while, I had this error :
>
>  Maxime> #error It appears you have defined
>  Maxime> _FILE_OFFSET_BITS=64. Unfortunately, uClibc was built without
>  Maxime> large file support enabled.
>
> You have to do a make clean before changing to a new .config.
When I retryied the whole procuder I did a make clean between each
operation, to be on the safe side.
>
> --
> Bye, Peter Korsgaard
