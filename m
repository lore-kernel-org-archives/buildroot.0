From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 08 Nov 2014 17:34:37 +0100
Subject: [Buildroot] [PATCH] arptables: re-enable for static
In-Reply-To: <1415452943-11931-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sat, 8 Nov 2014 10:22:23 -0300")
References: <1415452943-11931-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <877fz5veg2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Add a small patch to re-enable arptables for static builds.
 > The dlfcn.h is a stray include for a past attempt at loadable plugins
 > but the code is disabled so there's no need for it.

 > Also add hash file.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Yeah, I didn't noticed that the code was within a #if 0 conditional when
grepping for dlopen.

Committed, thanks.

-- 
Bye, Peter Korsgaard
