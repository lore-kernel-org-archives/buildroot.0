From: Steinhilber, Markus <Markus.Steinhilber@erbe-med.com>
Date: Mon, 8 Apr 2019 14:43:30 +0000
Subject: [Buildroot] Wrong license information in package qt5quickcontrols2?
Message-ID: <017c92fcfda14fe3b07c0dcc70bbaf5e@erbe-med.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I think the license information in the package qt5quickcontrols2 is wrong. But since I'm not an expert on licensing I didn't want to post a patch.

The .mk file includes this line: "QT5QUICKCONTROLS2_LICENSE = GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)", but on the Qt Website(https://doc.qt.io/qt-5/qtquickcontrols-index.html) it states: "Qt Quick Controls 2 is available under commercial licenses from The Qt Company. In addition, it is available under the GNU Lesser General Public License, version 3, or the GNU General Public License, version 2." So from this info I would say the .mk file should contain "QT5QUICKCONTROLS2_LICENSE = GPL-2.0 or LGPL-3.0, GFDL-1.3 (docs)".

But one thing that is even more confusing to me, is that the source folder of the package contains license files for GPL2, GPL3 and LGPL3, so from my understanding I should be able to choose any one of those licenses. So it should really be "QT5QUICKCONTROLS2_LICENSE = GPL-2.0, GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)". Am I correct?

Can someone with more knowledge on licensing confirm or disapprove on this?

Regards,
Markus Steinhilber
________________________________

Erbe Elektromedizin GmbH Firmensitz: 72072 Tuebingen Geschaeftsfuehrer: Christian O. Erbe, Reiner Thede Registergericht: Stuttgart HRB 380137
