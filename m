From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Oct 2020 21:56:29 +0200
Subject: [Buildroot] [PATCH v1] package/qt5base: XCB support needs
 xcb-util-renderutil
In-Reply-To: <20200927212000.16959-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sun, 27 Sep 2020 23:20:00 +0200")
References: <20200927212000.16959-1-ps.report@gmx.net>
Message-ID: <87ft6w1jwy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > The qt5base feature 'xcb_syslibs' is a compile check
 > using a xcb_render_util call (see qt5base-5.15.1/src/gui/configure.json).

 > Fixes:
 >   - http://autobuild.buildroot.net/results/3c05e597c073b823f8b091e17b676ed3ecf6b5b3

 >   ERROR: Feature 'xcb' was enabled, but the pre-condition 'features.thread && libs.xcb && tests.xcb_syslibs && features.xkbcommon-x11' failed.

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
