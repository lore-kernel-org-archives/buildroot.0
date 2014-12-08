From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Dec 2014 17:19:19 +0100
Subject: [Buildroot] [PATCH branch/next] pinentry: bump version to 0.9.0
In-Reply-To: <5485CD80.2080705@imgtec.com>
References: <1417190979-53042-1-git-send-email-Vincent.Riera@imgtec.com>
 <20141208102220.7a8242d2@free-electrons.com>
 <548577F0.5020700@imgtec.com> <5485C831.4090205@imgtec.com>
 <20141208165219.313b9967@free-electrons.com>
 <5485CD80.2080705@imgtec.com>
Message-ID: <20141208171919.14471823@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Mon, 8 Dec 2014 16:10:40 +0000, Vicente Olivert Riera wrote:

> I can send a patch to pinentry to make the accessibility part optional.
> Do you prefer I mark my current patch as rejected and do another one
> including the patch for making the accessibility part optional instead
> of modifying packages/qt/qt.mk?

I was suggesting to make the accessibility feature in Qt optional, and
then have the pinentry package select this option in Qt.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
