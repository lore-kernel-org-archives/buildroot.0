From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 22:50:36 +0200
Subject: [Buildroot] [PATCH v4 01/10] package/python3: add optional
 support for lzma
In-Reply-To: <20161009124625.23303-1-bernd.kuhls@t-online.de>
References: <20161009124625.23303-1-bernd.kuhls@t-online.de>
Message-ID: <20161009225036.6e2038f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Oct 2016 14:46:16 +0200, Bernd Kuhls wrote:

> +config BR2_PACKAGE_PYTHON3_XZ
> +	select BR2_PACKAGE_XZ
> +	bool "xz module"

We normally have the "bool" definition first, and then the depends on,
and then the selects. So I've inverted those two lines.

Since it was not consistent in this Config.in file, I've done a
follow-up commit to fix this for the other Config.in variables.

Applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
