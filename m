From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 28 Sep 2014 20:50:23 +0200
Subject: [Buildroot] [PATCH v2 1/5] package/pkg-cmake.mk: remove the
	USE_CCACHE CMake flag for host-package
In-Reply-To: <1408653920-18954-2-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Thu, 21 Aug 2014 22:45:16 +0200")
References: <1408653920-18954-1-git-send-email-s.martin49@gmail.com>
 <1408653920-18954-2-git-send-email-s.martin49@gmail.com>
Message-ID: <87eguvwpe8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > The USE_CCACHE CMake flag is only useful when building target package
 > (only the toolchainfile.cmake uses it).

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
