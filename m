From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Sep 2017 19:55:58 +0200
Subject: [Buildroot] [PATCH] package/python3: bump to 3.6.2
In-Reply-To: <20170918223441.2129-1-andrew.smirnov@gmail.com> (Andrey
 Smirnov's message of "Mon, 18 Sep 2017 15:34:41 -0700")
References: <20170918223441.2129-1-andrew.smirnov@gmail.com>
Message-ID: <87bmm5xnip.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andrey" == Andrey Smirnov <andrew.smirnov@gmail.com> writes:

 > Bump Python3 version to 3.6.2.
 > Patches dropped:

 > "Support PGEN_FOR_BUILD and FREEZE_IMPORTLIB_FOR_BUILD"

 > Rationale: With commit 9d02f562961efd12d3c8317a10916db7f77330cc, code
 > generation step of building CPython now became explicit (instead of
 > always performed as a part of 'make' invocation) and more granular. We
 > no longer need to use Parser/pgen at all and tricking the build system
 > into using different Programs/_freeze_importlib can be done as a part
 > of recipe.

 > Additional info about the build change can be found at
 > https://bugs.python.org/issue23404

 > Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Committed, thanks. Thanks for the detailed commit message and comments
in the .mk

-- 
Bye, Peter Korsgaard
