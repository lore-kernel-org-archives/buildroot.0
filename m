From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 17:52:37 +0200
Subject: [Buildroot] [PATCH] logrotate: Bump version to 3.8.9
In-Reply-To: <1427675556-9240-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
References: <1427675556-9240-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
Message-ID: <20150330175237.530fba0d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Mon, 30 Mar 2015 02:32:36 +0200, Beno?t Th?baudeau wrote:

>  LOGROTATE_DEPENDENCIES = popt host-pkgconf
> +LOGROTATE_AUTORECONF = YES

Why do we want to autoreconf ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
