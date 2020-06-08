From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Jun 2020 23:33:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/linux-pam: bump to version 1.4.0
In-Reply-To: <20200608165937.48322-1-fontaine.fabrice@gmail.com>
References: <20200608165937.48322-1-fontaine.fabrice@gmail.com>
Message-ID: <20200608233311.1faf3d0f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  8 Jun 2020 18:59:37 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop first patch, not needed since
>   https://github.com/linux-pam/linux-pam/commit/4dd9b97b762cc73816cb867d49c9d0d0b91d642c
> - Drop other patches (already in version)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks! But then presumably we can drop AUTORECONF = YES, if we no
longer have any patches ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
