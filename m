From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Feb 2015 11:04:48 +0100
Subject: [Buildroot] [PATCH v2] qt-webkit-kiosk: new package
In-Reply-To: <CALR4fE+EWhwQMX2w7eZTFMpaurAjTo_n8fqes_fbBt5yhO=HSA@mail.gmail.com>
References: <1424497549-8506-1-git-send-email-jerome.oufella@savoirfairelinux.com>
 <1424578920-21071-1-git-send-email-jerome.oufella@savoirfairelinux.com>
 <20150222223215.701a0a03@free-electrons.com>
 <CALR4fE+EWhwQMX2w7eZTFMpaurAjTo_n8fqes_fbBt5yhO=HSA@mail.gmail.com>
Message-ID: <20150227110448.3fde124f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Diego Iastrubni,

On Thu, 26 Feb 2015 14:04:17 +0200, Diego Iastrubni wrote:

> I disagree. It feels like the problem is in the BR2_PACKAGE_QT5WEBKIT
> target - it should depend on
> BR2_PACKAGE_QT5BASE_GUI and BR2_PACKAGE_QT5BASE_WIDGETS

qt5webkit did build perfectly fine with BR2_PACKAGE_QT5BASE_WIDGETS
disabled. It just doesn't build the part called qt5webkitwidgets, which
qt-webkit-kiosk uses.

It was really the build of qt-webkit-kiosk that failed due to the
missing qt5webkitwidgets, the qt5webkit build was alright.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
