From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 06 Feb 2015 20:02:38 +0100
Subject: [Buildroot] [PATCH v2] qt5/qt5base: Fix build on big endian
	systems
In-Reply-To: <1423234139-33913-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Fri, 6 Feb 2015 14:48:59 +0000")
References: <1423234139-33913-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <874mqyamnl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Backporting an upstream patch to fix a qt5base build failure on big
 > endian systems. This is the error message:

 > image/qimage_conversions.cpp:2257:9: error: expected '}' before numeric
 > constant

 > Upstream commit:

 >   https://qt.gitorious.org/qt/qtbase/commit/404f4281fda764cafdaa5635db995dabc4f1de8c

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > ---
 > v1 -> v2: commit message amended

Committed, thanks.


-- 
Bye, Peter Korsgaard
