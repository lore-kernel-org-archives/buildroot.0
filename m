From: daggs <daggs@gmx.com>
Date: Mon, 9 Jan 2017 15:09:15 +0100
Subject: [Buildroot] using custom compiler for a specific pkg
In-Reply-To: <87vatoo33a.fsf@dell.be.48ers.dk>
References: <trinity-e5bd221b-be64-4b4d-af05-5b49f36635fa-1483821716512@3capp-mailcom-bs06>,
 <87vatoo33a.fsf@dell.be.48ers.dk>
Message-ID: <trinity-350803ff-724f-4b64-8ccd-ee0cf1d90354-1483970955208@3capp-mailcom-bs09>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,
>  > Greetings,
>  > I want to test a theory I have and I need to compile a specific pkg with a compiler that differs from the buildroot's main compiler.
>  > how can I do that?
> 
> That sounds odd. Depending on the build system of that package you can
> probably tell it to use a different compiler by pointing CC= to it?
> 

I know, there seems to be a issue with envs created on odroidc2 and gcc compilers when it comes to stability, it seems that instead of one timer, two timers are enabled. that wrecks havoc on the heartbeat which seems to cause the system to freeze.

the offical hk buildroot uses linaro external toolchain and all works well.
the libreelec env with supports for the board compiles the entire image with gcc 5.x beside u-boot which it compiles with the same toolchain hk uses.
I want to try and mimic the same flow and see if the issue presists as I didn't saw any similar freezes on both examples above.

I'll look into it, thanks.

Dagg.
