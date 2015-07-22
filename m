From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 16:48:19 +0200
Subject: [Buildroot] [PATCH] binutils: bump 2.25.x series to 2.25.1
In-Reply-To: <1437573697-12191-1-git-send-email-gustavo@zacarias.com.ar>
References: <1437573697-12191-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150722164819.2b9474e8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 22 Jul 2015 11:01:37 -0300, Gustavo Zacarias wrote:

> -	config BR2_BINUTILS_VERSION_2_25
> -		bool "binutils 2.25"
> +	config BR2_BINUTILS_VERSION_2_25_1
> +		bool "binutils 2.25.1"

I know we haven't been doing this so far, but should we name the option
2_25_X like we do for gcc, and therefore avoid renaming the option for
every minor release ? Or keep it named 2_25 even if the version is
2.25.1, I don't really care.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
