From: Cyril HAENEL <chaenel@free.fr>
Date: Mon, 04 May 2009 22:56:51 +0200
Subject: [Buildroot] Problem with LZO package in ARM configuration,
 need help to solve the problem
In-Reply-To: <87eiv465a9.fsf@macbook.be.48ers.dk>
References: <49FEC5F7.9070808@free.fr>
	<877i0x6r8l.fsf@macbook.be.48ers.dk>	<49FED95C.5040802@free.fr>
	<87y6td59d7.fsf@macbook.be.48ers.dk>	<49FEEB68.30800@free.fr>
	<87tz4156qv.fsf@macbook.be.48ers.dk>	<49FEF1D5.8020203@free.fr>
	<87eiv465a9.fsf@macbook.be.48ers.dk>
Message-ID: <49FF5693.5060600@free.fr>
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
I reactived my old arm toolchain installation, and with the last git 
version it works ;)

Thank you again for you help

Cyril

-- 

Cyril Haenel
Registered Linux User #332632
