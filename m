From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 Jan 2011 21:29:26 +0100
Subject: [Buildroot] [PATCH 06/10] libcuefile: new package
In-Reply-To: <1295369680-24816-7-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Tue, 18 Jan 2011 13:54:36 -0300")
References: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>
	<1295369680-24816-7-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87oc7b9v4p.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/multimedia/Config.in                |    1 +
 Gustavo>  package/multimedia/libcuefile/Config.in     |    6 ++++
 Gustavo>  package/multimedia/libcuefile/libcuefile.mk |   41 +++++++++++++++++++++++++++

Committed with the TARGET_CC_NOCCACHE fix for cmake.

-- 
Bye, Peter Korsgaard
