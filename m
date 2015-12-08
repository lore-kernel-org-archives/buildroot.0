From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 08 Dec 2015 21:54:45 +0100
Subject: [Buildroot] [PATCH] pixman: disable vmx for powerpc CS
	toolchains
In-Reply-To: <1449498431-5872-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 7 Dec 2015 11:27:11 -0300")
References: <1449498431-5872-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <871tawmzje.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > The ppc CS toolchains have flaky VMX (AKA altivec) implementation
 > causing build failure. Disable it for these toolchains. Fixes:
 > http://autobuild.buildroot.net/results/3b4/3b4cda40f074578f6b35b1fb381ba37b93174e86/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
