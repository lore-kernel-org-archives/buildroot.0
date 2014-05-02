From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 02 May 2014 15:07:51 +0200
Subject: [Buildroot] [PATCH] libwebsockets: disable checks for C++
	compiler
In-Reply-To: <1399034435-25851-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Fri, 2 May 2014 14:40:35 +0200")
References: <1399034435-25851-1-git-send-email-s.martin49@gmail.com>
Message-ID: <878uqkpbvc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > Since libwesockets in written in pure C, no C++, there is no reason to
 > disable it or make the configuration failed when the toolchain has no
 > C++ support.

 > Unfortunately, CMake defaults sets C and C++ as languages used by the
 > project. This makes the configuration failed if no C++ compiler is found.

 > This patch just make the CMake code of libwebsockets reflecting the real
 > status of the project with regard to the languages used.

 > Should fix:
 >   http://autobuild.buildroot.org/results/fef/fef98ef289d44d13ec61025c50febba1e835b421/

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
