From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Sat, 17 Nov 2012 09:38:50 +0100
Subject: [Buildroot] [PATCH] python: uses fork(),
	only available on MMU platforms
In-Reply-To: <874nkowrzl.fsf@dell.be.48ers.dk>
References: <1353139970-25414-1-git-send-email-maxime.ripard@free-electrons.com>
 <874nkowrzl.fsf@dell.be.48ers.dk>
Message-ID: <50A74D1A.5030903@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 17/11/2012 09:31, Peter Korsgaard a ?crit :
>>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:
> 
>  Maxime> Fixes
>  Maxime> http://autobuild.buildroot.org/results/1738a8b09b04d2b2fc1de6d1ff5eb0363fed6348/build-end.log
> 
> Committed, thanks. What about python3?
> 
Ah, yes
Same thing for python3. I send a patch for that

Maxime

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
