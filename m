From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Apr 2017 23:13:32 +0200
Subject: [Buildroot] [PATCH] libcurl: bump version to 7.54.0 (security)
In-Reply-To: <20170419090742.33430-1-Vincent.Riera@imgtec.com>
References: <20170419090742.33430-1-Vincent.Riera@imgtec.com>
Message-ID: <20170420231332.3f9c87aa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Apr 2017 10:07:42 +0100, Vicente Olivert Riera wrote:
> Security fixes:
>  - CVE-2017-7468: switch off SSL session id when client cert is used
> 
> Full changelog: https://curl.haxx.se/changes.html
> 
> Removing 0001-CVE-2017-7407.patch. It's included in this release:
>   https://github.com/curl/curl/commit/1890d59905414ab84a35892b2e45833654aa5c13
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/libcurl/0001-CVE-2017-7407.patch | 61 --------------------------------
>  package/libcurl/libcurl.hash             |  2 +-
>  package/libcurl/libcurl.mk               |  2 +-
>  3 files changed, 2 insertions(+), 63 deletions(-)
>  delete mode 100644 package/libcurl/0001-CVE-2017-7407.patch

Applied to master, thanks.

Peter: we want this for the LTS branch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
