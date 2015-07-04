From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 14:57:59 +0200
Subject: [Buildroot] [PATCH 2/2] isl: bump to version 0.14.1
In-Reply-To: <1436013207-29587-2-git-send-email-gustavo@zacarias.com.ar>
References: <1436013207-29587-1-git-send-email-gustavo@zacarias.com.ar>
 <1436013207-29587-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150704145759.25ff3ada@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat,  4 Jul 2015 09:33:27 -0300, Gustavo Zacarias wrote:

>  # Our libtool patch doesn't apply, and since this package is only
> -# built for the host, we don't really care about it.
> +# # built for the host, we don't really care about it.

Not sure why this change was done. Applied after reverting this change.
But did you check that our libtool patch still doesn't apply?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
