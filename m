From: Cyril HAENEL <chaenel@free.fr>
Date: Mon, 04 May 2009 15:47:01 +0200
Subject: [Buildroot] Problem with LZO package in ARM configuration,
 need help to solve the problem
In-Reply-To: <87tz4156qv.fsf@macbook.be.48ers.dk>
References: <49FEC5F7.9070808@free.fr>
	<877i0x6r8l.fsf@macbook.be.48ers.dk>	<49FED95C.5040802@free.fr>
	<87y6td59d7.fsf@macbook.be.48ers.dk>	<49FEEB68.30800@free.fr>
	<87tz4156qv.fsf@macbook.be.48ers.dk>
Message-ID: <49FEF1D5.8020203@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Hi,
>
>  Cyril> I think lzo is compiled in the 2 configuration, for the host and for
>  Cyril> the target.
>  Cyril> Because when we activate the jffs2 filesystem output, I think
>  Cyril> buildroot need mkfs.jffs2 and I think mkfs.jffs2 needs lzo.
>  Cyril> But because mtd-utils (and also mkfs.jffs2) is provided in the target,
>  Cyril> I think lzo is also compiled for the target.
>
> Exactly - What is it that fails, lzo for the host or lzo for the
> target? (the directory name should show it)
>
>   
The problem was in build_arm directory, thus I think it's the target 
compilation which fails when we have an already installed (old) arm 
toolchain.



-- 

Cyril Haenel
Registered Linux User #332632
