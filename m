From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Thu, 30 Jun 2011 22:26:40 +0000
Subject: [Buildroot] modprobe && .xz files??
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C603A563@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C603A563@ex-mb1.corp.adtran.com>
Message-ID: <F9C551623D2CBB4C9488801D14F864C603A5ED@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> How do I go about telling modprobe to look for the <mod
> name>.ko.xz?

Answer my own question:

You only have to change the name of the module in modules.dep:

<path to>/jffs2/jffs2.ko

becomes

<path to>/jffs2/jffs2.ko.xz


Bad thing is, I couldn't find this documented anywhere, however, I'm
not the best at searching the web ;).

Andy
