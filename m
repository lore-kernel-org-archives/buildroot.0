From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 00:05:07 +0200
Subject: [Buildroot] [PATCH 06/16] erlang-p1-iconv: bump to version 1.0.4
In-Reply-To: <20170530145211.15320-7-johan.oudinet@gmail.com>
References: <20170530145211.15320-1-johan.oudinet@gmail.com>
 <20170530145211.15320-7-johan.oudinet@gmail.com>
Message-ID: <20170531000507.2c3b5cd5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 30 May 2017 16:52:01 +0200, Johan Oudinet wrote:

>  	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
> +	select BR2_PACKAGE_ERLANG_P1_UTILS

I fixed the alphabetic ordering here.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
