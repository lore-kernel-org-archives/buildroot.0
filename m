From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 11:44:26 +0200
Subject: [Buildroot] [PATCH 1/1] Add $$(PKG)_AUTORECONF_ENV argument to
 autotools package
In-Reply-To: <38A5475DE83986499AEACD2CFAFC3F9801148D3335@tss-server1.home.tropicalstormsoftware.com>
References: <38A5475DE83986499AEACD2CFAFC3F9801148D3335@tss-server1.home.tropicalstormsoftware.com>
Message-ID: <20140717114426.751de13d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rick Taylor,

On Thu, 17 Jul 2014 09:36:16 +0000, Rick Taylor wrote:
> From 017be6459b46388f9377d00c2f48e838ec3ff98b Mon Sep 17 00:00:00 2001
> From: Rick Taylor <rick.taylor@cassidian.com>
> Date: Thu, 17 Jul 2014 10:04:10 +0100
> Subject: [PATCH 1/1] Add $$(PKG)_AUTORECONF_ENV argument to autotools package
> 
> Signed-off-by: Rick Taylor <rick.taylor@cassidian.com>
> ---
>  package/pkg-autotools.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks for the patch. Could you detail a bit the use case you have for
$$($$(PKG)_AUTORECONF_ENV) ?

Also, an update to docs/manual/adding-packages-autotools.txt is needed
to take into account this new variable in the documentation.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
