From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Feb 2017 23:32:33 +0100
Subject: [Buildroot] [PATCH v1] qt5quickcontrols: fix LTS (5.6) qml file
	install
In-Reply-To: <20170220214105.8106-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Mon, 20 Feb 2017 22:41:05 +0100")
References: <20170220214105.8106-1-ps.report@gmx.net>
Message-ID: <87ino4pk72.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Fixes [1]:
 >   cp -dpfr .../host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/qml/QtQuick/PrivateWidgets .../target/usr/qml/QtQuick
 >   cp: cannot stat ?.../host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/qml/QtQuick/PrivateWidgets?: No such file or directory

 > [1] https://bugs.busybox.net/show_bug.cgi?id=9666

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
