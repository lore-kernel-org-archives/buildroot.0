From: Mark Jackson <mpfj-list@mimc.co.uk>
Date: Thu, 24 Sep 2009 11:45:05 +0100
Subject: [Buildroot] Problem with defconfig
In-Reply-To: <874oqurm9z.fsf@macbook.be.48ers.dk>
References: <4AB9F39B.4090300@mimc.co.uk> <874oqurm9z.fsf@macbook.be.48ers.dk>
Message-ID: <4ABB4DB1.2000201@mimc.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Mark" == Mark Jackson <mpfj-list@mimc.co.uk> writes:
> 
>  Mark> If I pull down the latest git and try to make a defconfig,
>  Mark> I get the following:-
> 
>  Mark> $ make atngw100-base_defconfig
>  Mark> make: *** No rule to make target `atngw100-base_defconfig'. Stop.

I've also noticed that "make saveconfig" does the same ...

mpfj at mpfj-x64:~/avr32/buildroot$ make saveconfig
make: *** No rule to make target `saveconfig'. Stop.

But "make", "make all" and "make menuconfig" are okay.

Mark
