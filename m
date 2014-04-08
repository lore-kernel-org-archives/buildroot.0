From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Apr 2014 23:14:21 +0200
Subject: [Buildroot] [PATCH 1/1] cppcms: fix build with uClibc
In-Reply-To: <1396898244-12852-1-git-send-email-lucile.quirion@savoirfairelinux.com>
 (Lucile Quirion's message of "Mon, 7 Apr 2014 15:17:24 -0400")
References: <1396898244-12852-1-git-send-email-lucile.quirion@savoirfairelinux.com>
Message-ID: <8738hnbk2a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lucile" == Lucile Quirion <lucile.quirion@savoirfairelinux.com> writes:

 > This patch modifies the cppcms package in order to support uClibc-based
 > toolchains.

 > The booster library by default compiles with the posix backend under
 > Linux, but this needs monetary.h which isn't provided by uClibc, so
 > work around that with the help of the DISABLE_POSIX_LOCALE configure
 > option.

 > Signed-off-by: Lucile Quirion <lucile.quirion@savoirfairelinux.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
