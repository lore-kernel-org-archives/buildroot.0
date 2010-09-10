From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 10 Sep 2010 13:29:41 +0200
Subject: [Buildroot] [PATCH] Convert pppd to gentargets,
	fix broken compilation with newer headers, fix radius support
In-Reply-To: <4C8549E0.5010600@zacarias.com.ar> (Gustavo Zacarias's message of
	"Mon, 06 Sep 2010 17:06:56 -0300")
References: <4C8549E0.5010600@zacarias.com.ar>
Message-ID: <87wrqtalay.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 Gustavo> Obsoletes all my previous pppd patches.
 Gustavo> * Convert pppd to gentargets
 Gustavo> * Properly support radius plugin by installing dictionaries
 Gustavo> * Fix broken compilation with 2.6.35 kernel headers (L2TP plugin breaks)

Thanks - A few comments:

 Gustavo> diff --git a/package/pppd/pppd-2.4.5-ol2tpv3-2.6.35.patch b/package/pppd/pppd-2.4.5-ol2tpv3-2.6.35.patch

Please add a git-like patch header explaining what the patch fixes
including your signed-off-by, and if applicable it's upstream status.


-- 
Bye, Peter Korsgaard
