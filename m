From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Mar 2014 19:21:44 +0100
Subject: [Buildroot] [PATCH v3] bluez5_utils: new package.
In-Reply-To: <1395323298-15098-1-git-send-email-marcin@bis.org.pl>
References: <20140304213845.GG11474@free.fr>
 <1395323298-15098-1-git-send-email-marcin@bis.org.pl>
Message-ID: <20140320192144.2c53f07a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marcin Bis,

On Thu, 20 Mar 2014 14:48:18 +0100, Marcin Bis wrote:

> The patch follows:

Thanks a lot, but the patch should be in a separate e-mail. As you sent
it, all your discussion answering Yann's comment would end up in the
patch commit log.

> bluez5_utils: new package.
> 
> API is not backwards compatible with BlueZ 4.
> 
> BlueZ utils will use systemd and/or udev if enabled.
> Contains a hook for installing GATT support tool, wchich is always
> build but not installed by default.

Also your Signed-off-by line is missing.

See
http://buildroot.org/downloads/manual/manual.html#_contributing_to_buildroot
for more details about formatting patches.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
