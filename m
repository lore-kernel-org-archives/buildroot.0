From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 11:22:27 +0200
Subject: [Buildroot] [PATCH] qt/qt5webchannel: new package
In-Reply-To: <55AF5F3F.3080307@ecagroup.com>
References: <1437551725-24160-1-git-send-email-corjon.j@ecagroup.com>
 <20150722110713.6be3ca53@free-electrons.com>
 <55AF5F3F.3080307@ecagroup.com>
Message-ID: <20150722112227.2094b734@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please don't reply to me directly, keep the Buildroot mailing list in
Cc. Otherwise, it doesn't make much sense to go through the hassle of
writing in English :-)

On Wed, 22 Jul 2015 09:15:49 +0000, Julien CORJON wrote:

> > I'm certainly not sure the patch to fix the !qml build issue is the
> > right one, we'll see what upstream says. But other than that, the
> > package looks good, so let's get some autobuilder coverage of it.
> 
> Patch is ugly but i'm not sure of the Qt QT_QML_LIB macro durability. 
> That's why I've prefered create my own macro using CXX_FLAGS.
> I've tested this patch both with and without qml module and it compile 
> in both case.

Ok, understood. We'll see what upstream says about this.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
