From: Dimitri Kaparis <kaparis.dimitri@gmail.com>
Date: Fri, 5 Aug 2011 10:56:16 +0300
Subject: [Buildroot] Arm build: asm error in libffi?
In-Reply-To: <20110804214923.37cc66df@skate>
References: <CAFzH18j2mFTzSOrf1S9ChgaJ3cGyoxTOOTtCOuX8prUt5rXLzQ@mail.gmail.com>
 <20110804214923.37cc66df@skate>
Message-ID: <CAFzH18ipP5GoxaF8bfNwjsqH6LsFj5NNPDCGQj347SW1o4t5Tg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 4, 2011 at 10:49 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Thu, 4 Aug 2011 12:40:53 +0300,
> Dimitri Kaparis <kaparis.dimitri@gmail.com> a ?crit :
>
>> I'm doing a build for arm using a crosstool-ng generated toolchain
>> (gcc 4.4.6, uclibc 0.9.30.3).
>> With buildroot-2011.05 I'm getting this:
>
> I guess it's a problem with the toolchain, because here libffi builds
> just fine with an ARM CodeSourcery toolchain.
>
> Which binutils version does your toolchain has ?

20.20.1, which is the latest release available through crosstool-ng.

arm-unknown-linux-uclibc-as --version says:
GNU assembler (crosstool-NG 1.12.0) 2.20.1.20100303

Curiously, I was able to complete a build the other day on another
host. I think the only difference was I used uclibc version 0.9.32
instead of 0.9.30.3 for the toolchain. Can this be related?
