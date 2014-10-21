From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Oct 2014 11:56:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/boost: enable building of
 boost_log
In-Reply-To: <CAEyFGJEWwhmQ0s=OC8=74P2bNyJw4kv=xEjxDyRBZRBYHfs7QQ@mail.gmail.com>
References: <1413811644-28525-1-git-send-email-yannickkiekens@gmail.com>
 <20141020170223.GC3742@free.fr> <20141020170703.GE3742@free.fr>
 <CAEyFGJEWwhmQ0s=OC8=74P2bNyJw4kv=xEjxDyRBZRBYHfs7QQ@mail.gmail.com>
Message-ID: <20141021115658.47053b77@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yannick Kiekens,

On Tue, 21 Oct 2014 09:15:24 +0200, Yannick Kiekens wrote:

> ?We use boost_log at work on x86_64 and armv7, we never had trouble with it.
> It is possible boost_log 1.56 still does not work on some toolchain
> combinations?, as mentioned in git
> commit 611dfe6cb55ed72d7df3b7c102f4a723248a4037
> 
> ?I could reformat the patch to whitelist boost_log on known configurations
> Any opnion on that?

Can you try looking at
http://autobuild.buildroot.net/results/c26/c26498f1a4e6bcbc3a2dfce6a51fa7d21b72f21f/build-end.log,
which is the issue reported in commit
611dfe6cb55ed72d7df3b7c102f4a723248a4037 ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
