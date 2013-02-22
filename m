From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 22 Feb 2013 19:42:01 +0100
Subject: [Buildroot] [PATCH] libffi: fix powerpc build breakage
In-Reply-To: <1361552133-16421-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 22 Feb 2013 13:55:33 -0300")
References: <1361552133-16421-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ip5kdwcm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Happens with the latest release when there are no FP registers.
 Gustavo> Fixes:
 Gustavo> http://autobuild.buildroot.net/results/bc43261d3ddc9d4c320522563249f4a0695a35a4/

Thanks, but probably it makes more sense to use Gilles' version:

http://sourceware.org/ml/libffi-discuss/2013/msg00079.html

-- 
Bye, Peter Korsgaard
