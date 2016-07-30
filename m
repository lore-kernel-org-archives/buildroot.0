From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 15:43:41 +0200
Subject: [Buildroot] [PATCH v2 1/1] libpqxx: new package
In-Reply-To: <20160728214458.13464-1-james.knight@rockwellcollins.com>
References: <20160728214458.13464-1-james.knight@rockwellcollins.com>
Message-ID: <20160730154341.01f20bdf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Jul 2016 17:44:58 -0400, James Knight wrote:
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> ---
> Changes v1 -> v2:
>   - Only show package/comment when postgresql is enabled (suggested from
>      comments by Thomas Petazzoni).
>   - Explicitly set BSD-3c license (instead of just BSD; pointed out by
>      Thomas Petazzoni).
>   - Removed LIBPQXX_SOURCE as it matches default (pointed out by Thomas
>      Petazzoni).
> ---
>  package/Config.in            |  1 +
>  package/libpqxx/Config.in    | 13 +++++++++++++
>  package/libpqxx/libpqxx.hash |  4 ++++
>  package/libpqxx/libpqxx.mk   | 16 ++++++++++++++++
>  4 files changed, 34 insertions(+)
>  create mode 100644 package/libpqxx/Config.in
>  create mode 100644 package/libpqxx/libpqxx.hash
>  create mode 100644 package/libpqxx/libpqxx.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
