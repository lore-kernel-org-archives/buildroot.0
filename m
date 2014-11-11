From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Nov 2014 14:00:57 +0100
Subject: [Buildroot] How-to export cross-toolchain and libraries to a
 build server?
In-Reply-To: <20833d047f3d4434b8eb867b1a46b526@DB3PR04MB108.eurprd04.prod.outlook.com>
References: <7b2f2b4d2f704f70a128d64f2b6f461f@DB3PR04MB108.eurprd04.prod.outlook.com>
 <20141111102509.56db799d@free-electrons.com>
 <156048fd0d6d4325bbe2ba0ff5b6e9e0@DB3PR04MB108.eurprd04.prod.outlook.com>
 <20141111104957.251e3809@free-electrons.com>
 <20833d047f3d4434b8eb867b1a46b526@DB3PR04MB108.eurprd04.prod.outlook.com>
Message-ID: <20141111140057.24538411@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Nov 2014 12:10:22 +0000, Fabrice Mousset | GEOCEPT GmbH
wrote:

> it works :-)

Cool!

> I have built my BSP with BR2_HOST_DIR (make BR2_HOST_DIR=/opt/crosstools/am335x) and made an archive of it (tar cJf am335x-sdk.tar.xz /opt/crosstools/am335x). Then expand this archive on the build server.
> And it simply works, Jenkins is now able to build Qt5 projects for my board.

Great.

> The SDK is quiet big (about 57MB), but it is a simple and quick solution.

57 MB are you sure? This looks very small to me, when you count the
toolchain + all the Qt5 libraries and headers.

> I will try to spend time on "relocatable SDK generation" in the next weeks to see if an easier/smarter solution is possible.

Great, looking forward to see contributions in this area!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
