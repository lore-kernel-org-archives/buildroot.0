From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Mar 2012 00:01:07 +0200
Subject: [Buildroot] [PATCH 5/7] psmisc: bump to version 22.16
In-Reply-To: <1332987903-12378-5-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 28 Mar 2012 23:25:01 -0300")
References: <1332987903-12378-1-git-send-email-gustavo@zacarias.com.ar>
 <1332987903-12378-5-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87sjgrdq3g.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

 Gustavo> +# Don't force -fstack-protector
 Gustavo> +PSMISC_CONF_OPT = --disable-harden-flags

We have a BR2_TOOLCHAIN_BUILDROOT_USE_SSP, so we shouldn't disable if we
know the toolchain supports it.

Other than that it looks good - Committed, thanks.

-- 
Bye, Peter Korsgaard
