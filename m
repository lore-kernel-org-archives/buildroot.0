From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 22 Feb 2013 20:44:33 +0100
Subject: [Buildroot] [PATCHv2] libffi: fix powerpc build breakage
In-Reply-To: <1361559414-19521-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 22 Feb 2013 15:56:54 -0300")
References: <1361559414-19521-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87a9qwdtge.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Happens with the latest release when there are no FP registers.
 Gustavo> Fixes:
 Gustavo> http://autobuild.buildroot.net/results/bc43261d3ddc9d4c320522563249f4a0695a35a4/

Committed, thanks!

-- 
Bye, Peter Korsgaard
