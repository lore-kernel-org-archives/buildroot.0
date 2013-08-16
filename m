From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Aug 2013 12:56:52 +0200
Subject: [Buildroot] kernel patches suggestion : series file ->make it a
 variable
In-Reply-To: <FAC1EE0BD8A0431EBFF14BEE70571910@JohanW7>
References: <FAC1EE0BD8A0431EBFF14BEE70571910@JohanW7>
Message-ID: <20130816125652.701e7173@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Fri, 16 Aug 2013 12:19:13 +0200, Sagaert Johan wrote:

> Now I use a 'series'  file in my board directory to specify what patches that should be applied to the kernel.
> I would love to see a menu entry where I can specify what list of patches that should be applied.(default value :series)

What's the difference between what you're asking and the already
existing BR2_LINUX_KERNEL_PATCH configuration option?

config BR2_LINUX_KERNEL_PATCH
        string "Custom kernel patches"
        help
          A space-separated list of patches to apply to the
          kernel. Each patch can be described as an URL, a local file
          path, or a directory. In the case of a directory, all files
          matching linux-*.patch in the directory will be applied.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
