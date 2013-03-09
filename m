From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 09 Mar 2013 22:24:35 +0100
Subject: [Buildroot] [PATCH] packages/flex: remove unnecessary
	BR2_PACKAGE_FLEX_LIBFL
In-Reply-To: <1362687441-500-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 7 Mar 2013 17:17:21 -0300")
References: <1362687441-500-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87boas1d2k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> The BR2_PACKAGE_FLEX_LIBFL knob was removed by
 Gustavo> bd72a13a4ca3033bacbaf9e9a2b424acf149f83d so remove it from the
 Gustavo> packages that used it since it's completely unnecessary.

Committed, thanks.

-- 
Bye, Peter Korsgaard
