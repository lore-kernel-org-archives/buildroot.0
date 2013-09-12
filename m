From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Sep 2013 20:24:13 +0200
Subject: [Buildroot] [PATCH] ubifs filesystem image: line up and improve
 Config.in options
In-Reply-To: <7569d4f06765d241b20a.1378632798@argentina>
References: <7569d4f06765d241b20a.1378632798@argentina>
Message-ID: <20130912202413.78092338@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 08 Sep 2013 11:33:18 +0200, Thomas De Schampheleire wrote:
> Triggered by the 'some comment required here', this patch updates the Config.in
> comments for the ubifs filesystem image options. This includes:
> - 'erase block' --> 'eraseblock' (following mtd online documentation)
> - remove 'UBI' prefix to make options uniform. Sometimes the option is not a
>   property of UBI but rather of the flash. Also, line up the name of the option
>   with the help of mkfs.ubifs.
> - add help text on all options, referring to the mkfs.ubifs/ubinize options
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
