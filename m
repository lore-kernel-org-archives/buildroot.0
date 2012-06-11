From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Jun 2012 10:50:49 +0200
Subject: [Buildroot] [PATCH] synergy: Remove -Werror from CXXFLAGS
In-Reply-To: <4FD5A764.4040200@imgtec.com> (Markos Chandras's message of "Mon, 
 11 Jun 2012 09:08:04 +0100")
References: <1339063094-25298-1-git-send-email-markos.chandras@imgtec.com>
 <87ipeygwlz.fsf@macbook.be.48ers.dk> <4FD5A764.4040200@imgtec.com>
Message-ID: <877gvegrkm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <Markos.Chandras@imgtec.com> writes:

Hi,

 Markos> There is no configure.ac in the sources and this is why I patched the
 Markos> generated configure file.

True, but there's configure.in (the old name for configure.ac).

 Markos> As for the errors, I guess it depends on the toolchain and gcc
 Markos> version that is being used. I am seeing something like this:

 Markos> cc1plus: warnings being treated as errors CTCPSocket.cpp: In
 Markos> member function 'virtual void CTCPSocket::write(const void*,
 Markos> UInt32)': CTCPSocket.cpp:143: warning: 'wasEmpty' may be used
 Markos> uninitialized in this function

Ok, thanks.

-- 
Bye, Peter Korsgaard
