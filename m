From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 13:22:38 +0200
Subject: [Buildroot] [PATCH v1] qt5base: fix examples compile with
	disabled gui module
In-Reply-To: <20170507221823.4e2f3285@free-electrons.com> (Thomas Petazzoni's
 message of "Sun, 7 May 2017 22:18:23 +0200")
References: <20170427210150.1838-1-ps.report@gmx.net>
 <20170507221823.4e2f3285@free-electrons.com>
Message-ID: <874lwml5z5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Thu, 27 Apr 2017 23:01:50 +0200, Peter Seiderer wrote:
 >> Fixes [1]:
 >> 
 >> Project ERROR: Could not find feature opengl.
 >> 
 >> [1] http://autobuild.buildroot.net/results/040/040ab283dbbec623fe5ff4eaece754d9701fafc5
 >> 
 >> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 >> ---
 >> ...4-examples-fix-compile-without-gui-module.patch | 42 ++++++++++++++++++++++
 >> 1 file changed, 42 insertions(+)
 >> create mode 100644 package/qt5/qt5base/5.8.0/0004-examples-fix-compile-without-gui-module.patch

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
