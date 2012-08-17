From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Aug 2012 19:23:01 +0200
Subject: [Buildroot] [PATCH] openssl: security bump to version 1.0.0j
In-Reply-To: <502E7775.2060006@zacarias.com.ar>
References: <1336751148-28858-1-git-send-email-gustavo@zacarias.com.ar>
 <20120817184902.61d989c0@skate> <502E7775.2060006@zacarias.com.ar>
Message-ID: <20120817192301.2d60a15c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 17 Aug 2012 13:55:17 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> 1.0.1 is security-vulnerable, so it can't be bumped as-is, the target
> should be 1.0.1c at the moment.

Yes, agreed. I was referring to 1.0.1 as a branch, not specifically to
1.0.1. The patch I mentioned did target 1.0.1 because this patch is
about 6 months old.

> The big difference between 1.0.0* and 1.0.1* is that the later has
> initial support for TLSv1.1 and TLSv1.2 among other minor details.
> Both are API compatible though not ABI (and we don't care).
> I can give it a test during the weekend and give it a go for -next.

Great, thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
