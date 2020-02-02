From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Feb 2020 21:03:37 +0100
Subject: [Buildroot] [PATCH v1] package/qt5: bump latest version to
 5.12.7
In-Reply-To: <20200202191117.15684-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sun, 2 Feb 2020 20:11:17 +0100")
References: <20200202191117.15684-1-ps.report@gmx.net>
Message-ID: <871rrcoixy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > qt5base:
 >  - remove 0003-Do-not-load-plugin-from-the-PWD.patch
 >    (taken from upstream [1])
 >  - remove 0004-QLibrary-Unix-do-not-attempt-to-load-a-library-relat.patch
 >    (taken from upstream [2])

 > qt5webengine:
 >  - update 3rdparty license hash script to not include '*.pyc' files
 >  - update 3rdparty license hash list and chromium-latest.inc file

 > [1] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=bf131e8d2181b3404f5293546ed390999f760404
 > [2] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=e6f1fde24f77f63fb16b2df239f82a89d2bf05dd

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
