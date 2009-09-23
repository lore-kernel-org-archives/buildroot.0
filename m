From: Mark Jackson <mpfj-list@mimc.co.uk>
Date: Wed, 23 Sep 2009 11:53:33 +0100
Subject: [Buildroot] Problem with defconfig
In-Reply-To: <874oqurm9z.fsf@macbook.be.48ers.dk>
References: <4AB9F39B.4090300@mimc.co.uk> <874oqurm9z.fsf@macbook.be.48ers.dk>
Message-ID: <4AB9FE2D.1080009@mimc.co.uk>
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
> 
>  Mark> I've not used BR since the svn days, so has this changed ?
> 
> It shouldn't, and it works here:
> 
> make atngw100-base_defconfig
> cp ./target/device/Atmel/atngw100-base/atngw100-base_defconfig .config
> ...
> 
> Could you pull latest git and try again?

It *was* the latest git, which baffled me !!
