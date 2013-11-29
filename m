From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 29 Nov 2013 19:44:42 +0100
Subject: [Buildroot] [PATCH] qt5: Disable on MIPS64 BigEndian n64
	platforms
In-Reply-To: <1385738600-13376-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Fri, 29 Nov 2013 15:23:20 +0000")
References: <1385738600-13376-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <8738mfvyhx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > qt5base fails to compile on MIPS64 BigEndian n64 platforms because there
 > are multiple calls to some functions that are disabled. Since every Qt5
 > package depends on qt5base we can disable Qt5 entirely. This is a quick
 > fix for the next release. In the meantime, a proposed patch to fix this
 > problem has already been sent to Qt:

 > https://bugreports.qt-project.org/browse/QTBUG-35228

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
