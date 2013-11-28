From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 Nov 2013 22:47:24 +0100
Subject: [Buildroot] [PATCH v3 1/2] qt: Disable QtScript on
	non-supported platforms
In-Reply-To: <1385654237-36389-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Thu, 28 Nov 2013 15:57:14 +0000")
References: <1385654237-36389-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87r4a0xkpf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > There is no support for certain platforms in QtScript right now, so 
 > buildroot upstream suggested to disable the possibility of enabling 
 > QtScript on those platforms as a quick fix for the 2013.11 release:

 >    http://lists.busybox.net/pipermail/buildroot/2013-November/083157.html

 > QtScript doesn't build because it uses JavaScriptCore, so we re-use the
 > existing BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT option which already lists
 > which platforms are supported by JavaScriptCore in Qt4.

 > In addition, a proposed fix to add support for MIPS64 has already been
 > sent to Qt:

 >    https://bugreports.qt-project.org/browse/QTBUG-35030

 > Fixes:

 >    http://autobuild.buildroot.net/results/fd7/fd7e7e53290f235b540ed5f3c784e2584fdb41e0/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
