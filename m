From: Paul Cercueil <paul@crapouillou.net>
Date: Tue, 24 Dec 2013 22:06:44 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-12-23
In-Reply-To: <20131224084926.00230756@skate>
References: <20131224073009.58151100F70@stock.ovh.net>
 <20131224084926.00230756@skate>
Message-ID: <52B9F764.8030608@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 24/12/2013 08:49, Thomas Petazzoni a ?crit :
> Peter,
>
> On Tue, 24 Dec 2013 08:30:08 +0100 (CET), Thomas Petazzoni wrote:
>
>>     powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/ca6f973a296502984dbca270fefeaa86588393c9/
>>     powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/31284d7cafaea0e5ceb5d05f16832941c8c1ca30/
>>     powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/7158c91ffb45a1cc43e5c11c6b1cfdc7c96fff84/
>>     powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/f48a5248be0454878623a37e395bc811dc9439d5/
>>     powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/88dd97b524dc626e44e3eae0804a74a743de54f8/
>>        i686 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/2090afd09c425ac89294f884ce4c3f031beaecb1/
>>     powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/95e8abdd3b1fc30edeebf46c7534e067c43ae59c/
>>        sh4a |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/d1b88052d96500e1ffa96ab5d26e1f151f083b34/
>>         arm |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/bbddfb641be3b46a3b6915d6fb8bb3954fad65e2/
>>    mips64el |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/0e5e2a9c344c0d20dba2533277997ed08572beb5/
>
> Can you revert the util-linux patch from Paul that causes these
> problems? Paul hasn't submitted yet a fix, so I believe it's better to
> take a step back, revert the patch for now, and give Paul some time to
> work on a better patch that doesn't exhibit the above problems.
>
> Best regards,
>
> Thomas Petazzoni
>

Agreed. I probably won't have time to fix it before January.

Happy Christmas!

Paul Cercueil
