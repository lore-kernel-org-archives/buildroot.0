From: Mark Jackson <mpfj-list@mimc.co.uk>
Date: Wed, 23 Sep 2009 12:13:55 +0100
Subject: [Buildroot] Problem with defconfig
In-Reply-To: <87my4lrke1.fsf@macbook.be.48ers.dk>
References: <4AB9F39B.4090300@mimc.co.uk>
	<874oqurm9z.fsf@macbook.be.48ers.dk>	<4AB9FE2D.1080009@mimc.co.uk>
	<87my4lrke1.fsf@macbook.be.48ers.dk>
Message-ID: <4ABA02F3.6020706@mimc.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Mark" == Mark Jackson <mpfj-list@mimc.co.uk> writes:
> 
> Hi,
> 
>  >> Could you pull latest git and try again?
> 
>  Mark> It *was* the latest git, which baffled me !!
> 
> Me too. Do you have
> ./target/device/Atmel/atngw100-base/atngw100-base_defconfig ?
> 

mpfj at mpfj-x64:~/avr32/buildroot$ ls -la ./target/device/Atmel/atngw100-base/atngw100-base_defconfig
-rw-rw-rw- 1 mpfj mpfj 21720 2009-09-23 10:45 ./target/device/Atmel/atngw100-base/atngw100-base_defconfig
mpfj at mpfj-x64:~/avr32/buildroot$ make atngw100-base_defconfig
make: *** No rule to make target `atngw100-base_defconfig'. Stop.
mpfj at mpfj-x64:~/avr32/buildroot$ 
