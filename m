From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Dec 2012 16:19:22 +0100
Subject: [Buildroot] [PATCH 2/6] polkit: new package
In-Reply-To: <1356126670-16186-3-git-send-email-marek.belisko@open-nandra.com>
References: <1356126670-16186-1-git-send-email-marek.belisko@open-nandra.com>
 <1356126670-16186-3-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <20121222161922.59aad225@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marek Belisko,

On Fri, 21 Dec 2012 22:51:06 +0100, Marek Belisko wrote:

> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_DBUS_EXPAT

Are you sure this shouldn't be BR2_PACKAGE_EXPAT instead?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
