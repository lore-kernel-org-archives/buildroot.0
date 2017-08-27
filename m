From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Aug 2017 09:23:36 +0200
Subject: [Buildroot] [PATCH v2] modem-manager: update dependencies
In-Reply-To: <CAAP7uc+iakpbUqhHcrczfvEjdXDTwEvq3+yoOxcAzR4eYtR7ww@mail.gmail.com>
References: <20170825123015.10667-1-aleksander@aleksander.es>
 <20170825142120.26160-1-aleksander@aleksander.es>
 <20170825224135.6b053399@windsurf>
 <CAAP7uc+iakpbUqhHcrczfvEjdXDTwEvq3+yoOxcAzR4eYtR7ww@mail.gmail.com>
Message-ID: <20170827092336.1f6ed439@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 27 Aug 2017 09:05:15 +0200, Aleksander Morgado wrote:

> Understood; yes DBus is only runtime dependency, so the Config.in
> change would be enough.

Well, the package already has "select BR2_PACKAGE_DBUS", so that
shouldn't require any change.

> I guess the same happens with udev then? MM
> doesn't build-depend on udev, only on gudev (although it seems that
> gudev itself depends on udev).

Then yes, having "udev" in MODEM_MANAGER_DEPENDENCIES is useless.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
