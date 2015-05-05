From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 May 2015 17:25:16 +0200
Subject: [Buildroot] [PATCH] ipmiutil: force md2 off
In-Reply-To: <1430833434-717-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 5 May 2015 10:43:54 -0300")
References: <1430833434-717-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87a8xjoxlv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > The configure test runs against LIB_DIR (which is --libdir in configure
 > parlay) hence it's against the distro openssl version.
 > On newish openssl versions md2 is disabled by default, and buildroot
 > doesn't try to enable it (it's obsolete), but if the distro
 > libcrypto/openssl has it enabled then ipmiutil tries to use it.

 > Force it off to avoid build breakage. Fixes:
 > http://autobuild.buildroot.net/results/cd2/cd2e617f8e2b00581ab5936029f85e62ed3259ba/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
