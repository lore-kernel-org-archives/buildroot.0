From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 3 Mar 2018 20:51:39 +0100
Subject: [Buildroot] [PATCH] package/qt5/qt5scxml: install missing QML
 module
In-Reply-To: <20180302222423.678df640@windsurf.home>
References: <20180301074610.18946-1-b.bilas@grinn-global.com>
 <20180301115003.6cc39376@gmx.net>
 <20180302222423.678df640@windsurf.home>
Message-ID: <20180303205139.3e62b047@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,
On Fri, 2 Mar 2018 22:24:23 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> On Thu, 1 Mar 2018 11:50:03 +0100, Peter Seiderer wrote:
> 
> > The dependency on BR2_PACKAGE_QT5DECLARATIVE_QUICK is not needed, the QtScxml
> > module is build/installed even without enabled BR2_PACKAGE_QT5DECLARATIVE_QUICK...  
> 
> But does it make sense to install QML files if the Qt that has been
> built has no way to use them ? Or am I missing something about what
> BR2_PACKAGE_QT5DECLARATIVE_QUICK is ?

No expert for Qml/QtQuick either, but as explained in [1] 'QML is the Language (just like C++)'
and 'QtQuick is a toolkit for QML, allowing to develop graphical interface in QML language
(there are other toolkits for QML, some are graphical like Sailfish Silica or BlackBerry Cascade,
and some are non-graphical like QBS...'

Qscxml is usable from QtQuick, but QtQuick is no prerequisite to use Qscxml (from a theoretical
point of view (and practical the QML module is buildable  without QtQuick))....

Regards,
Peter

[1] https://stackoverflow.com/questions/19696153/difference-between-qt-qml-and-qt-quick

> 
> Best regards,
> 
> Thomas
