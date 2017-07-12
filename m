From: gomsis <tuzaklirefik@gmail.com>
Date: Wed, 12 Jul 2017 03:49:12 -0700 (PDT)
Subject: [Buildroot] [PATCHv2 2/3] qt5webengine: new package
In-Reply-To: <20170712021630.31121-3-gael.portay@savoirfairelinux.com>
References: <20170712021630.31121-1-gael.portay@savoirfairelinux.com>
 <20170712021630.31121-3-gael.portay@savoirfairelinux.com>
Message-ID: <1499856552195-170662.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Error while compiling

root at C1VAD58:/home/bsm/Desktop/buildroot# patch -p1
<PATCHv2-2-3-qt5webengine-new-package.patch
patching file package/qt5/Config.in
Hunk #1 succeeded at 78 with fuzz 1 (offset -1 lines).
patching file package/qt5/qt5webengine/0001-change-default-ssl-dir.patch
patching file package/qt5/qt5webengine/Config.in
patching file package/qt5/qt5webengine/chromium.inc
patching file package/qt5/qt5webengine/qt5webengine.hash
patching file package/qt5/qt5webengine/qt5webengine.mk

root at C1VAD58:/home/bsm/Desktop/buildroot# make
package/qt5/qt5webengine/chromium.inc:13: *** commands commence before first
target.  Stop.
root at C1VAD58:/home/bsm/Desktop/buildroot#




--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/PATCHv2-0-3-Qt-WebEngine-support-tp170633p170662.html
Sent from the Buildroot (busybox) mailing list archive@Nabble.com.
