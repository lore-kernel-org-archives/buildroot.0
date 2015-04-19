From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 23:25:43 +0200
Subject: [Buildroot] [PATCH 03/19] package/gnuchess: bump version to
 6.2.1
In-Reply-To: <1429453778-4178-3-git-send-email-bernd.kuhls@t-online.de>
References: <1429453778-4178-1-git-send-email-bernd.kuhls@t-online.de>
 <1429453778-4178-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150419232543.42265ce9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 19 Apr 2015 16:29:22 +0200, Bernd Kuhls wrote:

> diff --git a/package/gnuchess/0001-getline-conflicts.patch b/package/gnuchess/0001-getline-conflicts.patch
> deleted file mode 100644
> index 94add79..0000000
> --- a/package/gnuchess/0001-getline-conflicts.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -This patch fixes a conflict between the C library getline() function
> -and gnuchess getline() function.
> -
> -Patch borrowed from the gnuchess Debian package.

Has this patch been removed because it has been merged upstream? Or the
issue no longer exists in the upstream source code?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
