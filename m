From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 12:05:45 +0200
Subject: [Buildroot] [PATCH v2 1/6] package/perl-db_file: new package
In-Reply-To: <1430041039-13905-1-git-send-email-bernd.kuhls@t-online.de>
References: <1430041039-13905-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150426120545.3712305d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 26 Apr 2015 11:37:14 +0200, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: no changes

I've applied, after renaming to perl-db-file instead of perl-db_file.
Probably the scancpan script should be adjusted: we prefer '-' as a
separator in package names, rather than '_'. Yes I know there are some
counter examples, especially X.org packages.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
