From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Mar 2020 15:15:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/rocksdb: fix bzip2 option
In-Reply-To: <20200328132326.1120850-1-fontaine.fabrice@gmail.com>
References: <20200328132326.1120850-1-fontaine.fabrice@gmail.com>
Message-ID: <20200328151554.2cf20b0f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 28 Mar 2020 14:23:26 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 95bf830e2ae6b5548c17fd3ce6ac1a8d2aa0c8b6 forgot to replace
> ROCKSDB_CONF_OPTS by ROCKSDB_MAKE_OPTS for BR2_PACKAGE_BZIP2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/rocksdb/rocksdb.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
