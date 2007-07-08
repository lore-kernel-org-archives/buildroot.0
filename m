From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sun, 8 Jul 2007 15:53:03 +0200
Subject: [Buildroot] package/busybox: copy/paste err
In-Reply-To: <0707081541120.3987@somehost>
References: <0707081541120.3987@somehost>
Message-ID: <20070708135303.GO4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 08, 2007 at 03:42:30PM +0200, Cristian Ionescu-Idbohrn wrote:
>Index: Config.in
>===================================================================
>--- Config.in	(revision 19036)
>+++ Config.in	(working copy)
>@@ -100,7 +100,7 @@
> 	default "package/busybox/busybox-1.5.0.config" if BR2_BUSYBOX_VERSION_1_5_0
> 	default "package/busybox/busybox-1.5.0.config" if BR2_BUSYBOX_VERSION_1_5_1
> 	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_6_0
>-	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_6_1
>+	default "package/busybox/busybox-1.6.1.config" if BR2_BUSYBOX_VERSION_1_6_1

no. there is no busybox-1.6.1.config and there is no need for one
either. 1.6.1 is a pure bugfix release, we can reuse the config that's
already there.
