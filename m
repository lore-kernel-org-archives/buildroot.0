From: Matthew Dombroski <matthew.dombroski@gmail.com>
Date: Wed, 28 May 2008 17:08:43 +1200
Subject: [Buildroot] [PATCH] x11 xserver: Add xcalibrate proto,
	xcalibrate lib and xtscal app to xserver
In-Reply-To: <5BF78BCE8D9BF14A83F836BD9E3916BA0DDEE5@blrms.slti.sanyo.co.in>
References: <5BF78BCE8D9BF14A83F836BD9E3916BA0DDED8@blrms.slti.sanyo.co.in>
	<408540dd0805271509h27419f6an3cef5f4b9ddb625b@mail.gmail.com>
	<5BF78BCE8D9BF14A83F836BD9E3916BA0DDEE5@blrms.slti.sanyo.co.in>
Message-ID: <408540dd0805272208g2b7741cfvfcc533a9ff952756@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Extra patches (for x server) are needed to make xcalibrate extension work.
They can be found at
http://www.openembedded.org/repo/org.openembedded.dev/packages/xorg-xserver/xserver-kdrive-git/enable-xcalibrate.patch
http://www.openembedded.org/repo/org.openembedded.dev/packages/xorg-xserver/xserver-kdrive/xcalibrate-new-input-world-order.patch

~Matt
