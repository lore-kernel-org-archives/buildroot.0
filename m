From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 14:51:11 +0200
Subject: [Buildroot] [PATCH 1/3] toolchain: add 3.15 choice for headers
In-Reply-To: <1402313435-9013-1-git-send-email-gustavo@zacarias.com.ar>
References: <1402313435-9013-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140609145111.0c638fc1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon,  9 Jun 2014 08:30:33 -0300, Gustavo Zacarias wrote:

> +config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
> +	bool
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15

This should have been:

	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14

Other than that, I've applied your three patches to update to Linux
3.15.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
