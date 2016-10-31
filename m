From: Matt Kraai <kraai@ftbfs.org>
Date: Mon, 31 Oct 2016 08:18:52 -0700
Subject: [Buildroot] Unused QT5WEB{CHANNEL, SOCKETS}_INSTALL_TARGET_EXAMPLES
Message-ID: <20161031151852.GA12370@ftbfs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

QT5WEBCHANNELL_INSTALL_TARGET_EXAMPLES and
QT5WEBSOCKETS_INSTALL_TARGET_EXAMPLES are defined in
package/qt5/qt5webchannel/qt5webchannel.mk and
package/qt5/qt5webchannel/qt5websockets.mk, respectively, but they are
never used.  Should they be removed or should they be added to
QT5WEBCHANNEL_INSTALL_TARGET_CMDS and
QT5WEBSOCKETS_INSTALL_TARGET_CMDS?

-- 
Matt                                           https://ftbfs.org/~kraai/
