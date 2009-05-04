From: Cyril HAENEL <chaenel@free.fr>
Date: Mon, 04 May 2009 21:52:11 +0200
Subject: [Buildroot] Problem with LZO package in ARM configuration,
 need help to solve the problem
In-Reply-To: <87eiv465a9.fsf@macbook.be.48ers.dk>
References: <49FEC5F7.9070808@free.fr>
	<877i0x6r8l.fsf@macbook.be.48ers.dk>	<49FED95C.5040802@free.fr>
	<87y6td59d7.fsf@macbook.be.48ers.dk>	<49FEEB68.30800@free.fr>
	<87tz4156qv.fsf@macbook.be.48ers.dk>	<49FEF1D5.8020203@free.fr>
	<87eiv465a9.fsf@macbook.be.48ers.dk>
Message-ID: <49FF476B.5040605@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>  Cyril> The problem was in build_arm directory, thus I think it's the target
>  Cyril> compilation which fails when we have an already installed (old) arm
>  Cyril> toolchain.
>
> I've just committed a workaround to git (a035275) - Could you give it
> a try please?
>
>   
Sorry, but I don't understand, what do you want I try to do ?


-- 

Cyril Haenel
Registered Linux User #332632
