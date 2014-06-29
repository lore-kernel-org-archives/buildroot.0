From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 12:48:33 +0200
Subject: [Buildroot] [PATCH 1/2] icu: Delete inapropriate flag at link
In-Reply-To: <1403194417-19986-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1403194417-19986-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20140629124833.501df1ee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Thu, 19 Jun 2014 18:13:36 +0200, Maxime Hadjinlian wrote:
> From: Maxime Hadjinlian <maxime.hadjinlian@devialet.com>
> 
> Theses flags may cause libicudata to not be loaded on ARM EABIHF
> because it would be built for ARM EABI only.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@devialet.com>
> Cc: Thomas Petazzoni  <thomas.petazzoni@free-electrons.com>
> ---
>  .../icu/icu-004-link-icudata-as-data-only.patch    | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/icu/icu-004-link-icudata-as-data-only.patch

Thanks, patch applied, after adding more details following the
discussion with Arnout.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
