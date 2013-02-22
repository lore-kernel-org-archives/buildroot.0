From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 22 Feb 2013 20:44:22 +0100
Subject: [Buildroot] [PATCH] libffi: fix powerpc build breakage
In-Reply-To: <5127BFAE.50908@zacarias.com.ar> (Gustavo Zacarias's message of
 "Fri, 22 Feb 2013 15:57:50 -0300")
References: <1361552133-16421-1-git-send-email-gustavo@zacarias.com.ar>
 <87ip5kdwcm.fsf@dell.be.48ers.dk> <5127BFAE.50908@zacarias.com.ar>
Message-ID: <87ehg8dtgp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> On 02/22/2013 03:42 PM, Peter Korsgaard wrote:
 >> Thanks, but probably it makes more sense to use Gilles' version:
 >> 
 >> http://sourceware.org/ml/libffi-discuss/2013/msg00079.html

 Gustavo> Huh, missed it by a few hours, happens when you look at things
 Gustavo> the night before fixing them :) Honestly it doesn't make more
 Gustavo> sense since it's the same, it's just more fair, sent V2.

Yes, the patches are equivalent, just that it looks more likely that
Gilles' patch will end up in upstream git (as it was posted
first/acked), so it is easier for people to verify that it can be
dropped next time libffi gets bumped.

-- 
Bye, Peter Korsgaard
