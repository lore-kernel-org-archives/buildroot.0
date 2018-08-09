From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Aug 2018 00:00:47 +0200
Subject: [Buildroot] [PATCH v2 1/1] qt5wayland: add fix from upstream to
 compile without QtQuick
In-Reply-To: <a069c583-65e5-c788-95d8-53bc3da07d6f@je-eigen-domein.nl>
References: <1533515813-11533-1-git-send-email-bos@je-eigen-domein.nl>
 <20180809234736.010b22fc@windsurf>
 <a069c583-65e5-c788-95d8-53bc3da07d6f@je-eigen-domein.nl>
Message-ID: <20180810000047.3b86a8d0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 9 Aug 2018 23:55:15 +0200, Floris Bos wrote:

> > BR2_PACKAGE_WAYLAND doesn't require OpenGL support, so I'm wondering if
> > qt5wayland needs it or not. If it doesn't, could you send a follow-up
> > patch fixing this ?  
> 
> It currently does not compile without OpenGL.

OK.

> But I was also wondering whether or not that was meant to be as well.
> So had already opened an issue upstream: 
> https://bugreports.qt.io/browse/QTBUG-69779
> 
> Would indeed be nice if it was possible to do without OpenGL, as then we 
> could finally port some old Qt 4 QWS applications to Qt 5.

Sure. Thanks for the confirmation!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
