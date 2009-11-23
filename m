From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Mon, 23 Nov 2009 21:56:07 +0000 (UTC)
Subject: [Buildroot] How do I configure the kernel?
References: <he74ti$hbd$1@ger.gmane.org>
	<b680c1c10911201430s25dadd6aj8d1c48afaff91445@mail.gmail.com>
	<b680c1c10911201435k3e8e6988pea7dcaaa301ee5d7@mail.gmail.com>
	<he7s4s$330$1@ger.gmane.org> <87tywmffxl.fsf@macbook.be.48ers.dk>
	<heemnr$jrk$1@ger.gmane.org> <heepmc$umt$1@ger.gmane.org>
	<b680c1c10911231239t2e953a40q9eaebdc1daaf72be@mail.gmail.com>
	<heevib$jnn$1@ger.gmane.org>
	<b680c1c10911231350p7fd9f9beu6dda424828879727@mail.gmail.com>
Message-ID: <hef0dm$mr0$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2009-11-23, Nicholas Walton <nwalton@aplopteng.com> wrote:

>>> That does work, but a more direct way would be to do the linux
>>> configuration through buildroot.
>>>
>>> ~/buildroot % make menuconfig
>>> ~/buildroot % make linux26-menuconfig
>>> ~/buildroot % cp old-linux.config ?output/build/linux-$version/.config
>>> ~/buildroot % make linux26-$either_config
>>> ~/buildroot % make
>>
>> What is $either_config?
>
> menuconfig or oldconfig. Oldconfig will prompt you with new
> options, menuconfig assumes you know what you need to change
> from defaults.

While make linux26-menuconfig works, I could never get "make
linux26-oldconfig" to work.  That's why I resorted to the
method I described.

  $ make linux26-oldconfig
  make: *** No rule to make target linux26-oldconfig'.  Stop.

-- 
Grant Edwards                   grante             Yow! Are you selling NYLON
                                  at               OIL WELLS??  If so, we can
                               visi.com            use TWO DOZEN!!
