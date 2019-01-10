From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jan 2019 08:36:44 +0100
Subject: [Buildroot] [PATCH 1/2] xenomai: remove unnecessary autoreconf
In-Reply-To: <20190109203332.GM4022@scaer> (Yann E. MORIN's message of "Wed, 9
 Jan 2019 21:33:32 +0100")
References: <20190108203854.28015-1-patrickdepinguin@gmail.com>
 <20190109203332.GM4022@scaer>
Message-ID: <87imyxrmk3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> -# 0002-boilerplate-build-obstack-support-conditionally.patch
 >> -XENOMAI_AUTORECONF = YES
 >> 

 > This is causing failures in the CI:

 >     https://gitlab.com/buildroot.org/buildroot/pipelines/42622285

 > because there are now two consecutive empty lines.

Fixed, thanks. Odd that my check-package post-commit hook didn't catch
it.

-- 
Bye, Peter Korsgaard
