From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Apr 2008 17:29:23 +0200
Subject: [Buildroot] [PATCH] Return appropriate error code from
	pkgconfig script
In-Reply-To: <87a5b0800804010820h4118cf5exe610b2af9d8e8213@mail.gmail.com>
	(Will Newton's message of "Tue\, 1 Apr 2008 16\:20\:45 +0100")
References: <87a5b0800804010820h4118cf5exe610b2af9d8e8213@mail.gmail.com>
Message-ID: <87fxu5k2zw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:

 Will> Hi,
 Will> Currently the wrapper script for pkgconfig clobbers the return status
 Will> of pkgconfig. This is a problem for example when someone tries to run
 Will> "pkgconfig --exists". This patch should allow the correct return code
 Will> to be passed through. Note it uses the "pipefail" option that was
 Will> introduced with bash 3.

Thanks - Fixed in r21612.

-- 
Bye, Peter Korsgaard
