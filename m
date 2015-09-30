From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Sep 2015 22:57:29 +0200
Subject: [Buildroot] [PATCH] flashrom: fix static build
In-Reply-To: <8225a10ed43e5fd16fcbda9f2d3f5f5e94349a7b.1443634887.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 30 Sep 2015 20:41:27 +0300")
References: <8225a10ed43e5fd16fcbda9f2d3f5f5e94349a7b.1443634887.git.baruch@tkos.co.il>
Message-ID: <87lhbnwrpi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Use $(TARGET_MAKE_ENV) to set $PATH so as to make sure Buildroot pkg-config is
 > used. This corrects pkg-config output, and fixes static build.

 > Fixes:
 > http://autobuild.buildroot.net/results/b6e/b6e9f3cb7fa8019e631c14d9c832174125ec64ba/
 > http://autobuild.buildroot.net/results/30c/30c83f9c60ac5c7359ddabdc1f190ab12433ae92/
 > http://autobuild.buildroot.net/results/2a5/2a5da78dd5b2922796e3010e4a0477cb9f6355cb/

 > and more.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
