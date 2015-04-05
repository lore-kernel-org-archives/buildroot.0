From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Apr 2015 16:12:40 +0200
Subject: [Buildroot] [PATCH v2 4/4] package/apr-util: add support for
 unixodbc
In-Reply-To: <1425660584-25189-4-git-send-email-bernd.kuhls@t-online.de>
References: <1425660584-25189-1-git-send-email-bernd.kuhls@t-online.de>
 <1425660584-25189-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150405161240.6067063c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri,  6 Mar 2015 17:49:44 +0100, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: avoid picking up $(STAGING_DIR)/usr/bin/odbc_config, this file is
>     compiled for target and breaks unixodbc detection when used

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
