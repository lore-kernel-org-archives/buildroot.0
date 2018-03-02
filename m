From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Mar 2018 22:24:23 +0100
Subject: [Buildroot] [PATCH] package/qt5/qt5scxml: install missing QML
 module
In-Reply-To: <20180301115003.6cc39376@gmx.net>
References: <20180301074610.18946-1-b.bilas@grinn-global.com>
 <20180301115003.6cc39376@gmx.net>
Message-ID: <20180302222423.678df640@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 1 Mar 2018 11:50:03 +0100, Peter Seiderer wrote:

> The dependency on BR2_PACKAGE_QT5DECLARATIVE_QUICK is not needed, the QtScxml
> module is build/installed even without enabled BR2_PACKAGE_QT5DECLARATIVE_QUICK...

But does it make sense to install QML files if the Qt that has been
built has no way to use them ? Or am I missing something about what
BR2_PACKAGE_QT5DECLARATIVE_QUICK is ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
