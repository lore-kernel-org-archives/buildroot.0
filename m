From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Dec 2017 23:15:28 +0100
Subject: [Buildroot] [PATCH 1/2] hostapd: add support for wired driver
In-Reply-To: <20171227192900.1082-1-alexander.i.mukhin@gmail.com>
References: <20171224204920.uwyafn63a6lyyqan@speedy.hunter>
 <20171227192900.1082-1-alexander.i.mukhin@gmail.com>
Message-ID: <20171227231528.64169d9d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Dec 2017 22:29:00 +0300, Alexander Mukhin wrote:
> Add support for the wired authenticator (disabled by default).

disabled by default...

> These patches are meant to be applied after the series I sent before
> (see hostapd: new configuration options)

Could you please send a single series instead ? This makes the
dependency much clearer.

> +config BR2_PACKAGE_HOSTAPD_DRIVER_WIRED
> +	bool "Enable wired driver"
> +	default y

... but you're defaulting to "y".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
