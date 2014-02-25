From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 25 Feb 2014 20:58:12 +0100
Subject: [Buildroot] [PATCH] qt5connectivity: Don't build scanner
	example without QtQuick
In-Reply-To: <1393334742-38019-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Tue, 25 Feb 2014 13:25:42 +0000")
References: <1393334742-38019-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87r46rj76z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Apply upstream patch to fix this problem:
 > make[3]: Entering directory
 > `/home/test/test/3/output/build/qt5connectivity-5.2.0/examples/bluetooth'
 > cd scanner/ && ( test -e Makefile ||
 > /home/test/test/3/output/host/usr/bin/qmake
 > /home/test/test/3/output/build/qt5connectivity-5.2.0/examples/bluetooth/scanner/scanner.pro
 > -o Makefile ) && /usr/bin/make -f Makefile Project ERROR: Unknown
 > module(s) in QT: quick

 > Fixes:
 >    http://autobuild.buildroot.net/results/163/1635e4d385293ea560107bdf624033e8ffefbe72/

 > Upstream patch URL:
 >    https://qt.gitorious.org/qt/qtconnectivity/commit/1454664752505f5870e4173d15362bfdfe4148e7/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
