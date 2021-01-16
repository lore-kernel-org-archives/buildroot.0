From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 23:01:52 +0100
Subject: [Buildroot] [PATCH v2,1/1] package/htop: needs dynamic library
In-Reply-To: <20210107064855.261938-1-fontaine.fabrice@gmail.com>
References: <20210107064855.261938-1-fontaine.fabrice@gmail.com>
Message-ID: <20210116230152.1b100623@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  7 Jan 2021 07:48:55 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> htop unconditionally uses dlopen since version 3.0.3 and
> https://github.com/htop-dev/htop/commit/2a9e8ca07475e61e74d7b6f0afd0a5fd272cb07f
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2976729b0b95bf822c3095efbcf3f86d6c71874f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Drop static workaround for ARC

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
