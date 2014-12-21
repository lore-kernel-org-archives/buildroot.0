From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 22:03:05 +0100
Subject: [Buildroot] [buildroot-test 1/2] Taking into account
 BR2_PREFER_STATIC_LIB rename
In-Reply-To: <1418852858-818-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1418852858-818-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141221220305.7923490b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 Dec 2014 22:47:37 +0100, Thomas Petazzoni wrote:

>      if config["libc"] != "glibc" and randint(0, 20) == 0:
> -        configlines.append("BR2_PREFER_STATIC_LIB=y\n")
> +        configlines.append("BR2_STATIC_LIBS=y\n")

Instead, should I also sometimes test BR2_SHARED_STATIC_LIBS ? Like 5%
of times static only, 5% of times static+shared, and 90% of the time
shared only (the default) ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
