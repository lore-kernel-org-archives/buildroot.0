From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Aug 2012 23:01:00 +0200
Subject: [Buildroot] [PATCH 2/2] supervisor: new package
In-Reply-To: <1344669126-28921-3-git-send-email-net147@gmail.com>
References: <1344669126-28921-1-git-send-email-net147@gmail.com>
 <1344669126-28921-3-git-send-email-net147@gmail.com>
Message-ID: <20120811230100.30809b54@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 11 Aug 2012 17:12:06 +1000,
Jonathan Liu <net147@gmail.com> a ?crit :

> +config BR2_PACKAGE_SUPERVISOR
> +    bool "supervisor"
> +    select BR2_PACKAGE_PYTHON_SETUPTOOLS
> +    select BR2_PACKAGE_PYTHON_MELD3
> +    help
> +      A client/server system that allows its users to control a number
> +      of processes on UNIX-like operating systems.
> +
> +      http://supervisord.org/

Indentation was wrong, and dependency on the python interpreter was
missing.

I've fixed this and committed to next.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
