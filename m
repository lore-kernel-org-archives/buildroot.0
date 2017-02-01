From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Feb 2017 22:03:18 +0100
Subject: [Buildroot] [PATCH 1/1] libcurl: optional verbose strings config
In-Reply-To: <1485883613-48485-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1485883613-48485-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20170201220318.06114262@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 31 Jan 2017 11:26:53 -0600, Matt Weber wrote:
> From: Judd Meinders <judd.meinders@rockwellcollins.com>
> 
> This patch enables a config to set --enable-verbose during the
> configuration of libcurl.  The option is triggered by setting
> BR2_PACKAGE_LIBCURL_VERBOSE.
> 
> Signed-off-by: Judd Meinders <judd.meinders@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/libcurl/Config.in  | 5 +++++
>  package/libcurl/libcurl.mk | 9 ++++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)

There's only a 22 KB difference between verbose and non-verbose, so I
wasn't entirely sure a new sub-option was needed. But well, it's still
22 KB, so I've applied your patch. We'll see if others complain about
the additional sub-option for such a small size difference.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
