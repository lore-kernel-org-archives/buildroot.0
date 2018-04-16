From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 17:48:32 +0200
Subject: [Buildroot] [PATCH 1/1] qt5: qt5websockets: install missing qml
 modules
In-Reply-To: <3fc9a546-61c8-d7bf-f0eb-b757cae0dfe2@ginzinger.com>
References: <3fc9a546-61c8-d7bf-f0eb-b757cae0dfe2@ginzinger.com>
Message-ID: <20180416174832.0f092c09@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your contribution!

On Wed, 11 Apr 2018 14:40:37 +0200, Manfred Schlaegl wrote:
> QML modules for QtWebSockets are located in /usr/qml/QtWebSockets since
> Qt 5.5.
> 
> /usr/qml/Qt/WebSockets still exists for compatibility reasons, but
> it contains only a qmldir file which points to ../../QtWebSockets/.

Does this mean we should remove the installation
of /usr/qml/Qt/WebSockets ?

I've applied your patch to master as-is, anyway. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
