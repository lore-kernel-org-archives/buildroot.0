From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 13 Jul 2009 11:13:19 +0200
Subject: [Buildroot] [PATCH] optional DBus support in wpa_supplicant
In-Reply-To: <1247473258.4007.7.camel@sven>
References: <1247473258.4007.7.camel@sven>
Message-ID: <1247476399.4007.13.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, 2009-07-13 at 10:20 +0200, Sven Neumann wrote:

> the attached patch adds the buildroot config option
> BR2_PACKAGE_WPA_SUPPLICANT_DBUS. With this option enabled the DBus
> specific files from wpa_supplicant will be installed to the target and
> support for the DBus control interface will be compiled into
> wpa_supplicant. Please consider to include this patch.

After updating our copy of buildroot to the latest snapshot, I found
that the patch does not any longer apply cleanly. Attached is an updated
patch that does.


Sven


-------------- next part --------------
A non-text attachment was scrubbed...
Name: wpa-supplicant-dbus.diff
Type: text/x-patch
Size: 2443 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090713/3c8321a0/attachment.bin>
