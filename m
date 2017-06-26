From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jun 2017 22:22:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libxshmfence: needs
	sync_4
In-Reply-To: <20170624232505.585742bd@windsurf.home> (Thomas Petazzoni's
 message of "Sat, 24 Jun 2017 23:25:05 +0200")
References: <20170521113056.15378-1-bernd.kuhls@t-online.de>
 <20170624232505.585742bd@windsurf.home>
Message-ID: <87y3sefqj8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Sun, 21 May 2017 13:30:56 +0200, Bernd Kuhls wrote:
 >> Also propagate reverse dependency to mesa3d and xserver_xorg-server.
 >> 
 >> Fixes xserver_xorg-server build
 >> http://autobuild.buildroot.net/results/7da/7da8b46cda8786422e8293f26b79582b35a433d6/
 >> 
 >> For patch discussion refer to http://patchwork.ozlabs.org/patch/674595/
 >> 
 >> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 >> ---
 >> package/mesa3d/Config.in                                 | 3 ++-
 >> package/mesa3d/mesa3d.mk                                 | 2 +-
 >> package/x11r7/xlib_libxshmfence/Config.in                | 1 +
 >> package/x11r7/xserver_xorg-server/Config.in              | 3 ++-
 >> package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 +-
 >> 5 files changed, 7 insertions(+), 4 deletions(-)

 > Applied to master, after adjusting the select of
 > BR2_PACKAGE_XPROTO_PRESENTPROTO in mesa3d, as noticed by Romain Naour.

Committed to 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
