From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Feb 2018 10:14:40 +0100
Subject: [Buildroot] [PATCH] rsync: security bump to version 3.1.3
In-Reply-To: <958696d988eecdc48bea09ad76234933706a7e0a.1518153988.git.baruch@tkos.co.il>
References: <958696d988eecdc48bea09ad76234933706a7e0a.1518153988.git.baruch@tkos.co.il>
Message-ID: <20180210101440.738778d6@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  9 Feb 2018 07:26:28 +0200, Baruch Siach wrote:
> Fixes CVE-2018-5764: remote attackers can bypass an
> argument-sanitization protection mechanism
> 
> Drop upstream patches.
> 
> Add license file hash.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../0001-Check-fname-in-recv_files-sooner.patch    | 45 ----------------------
>  ...0002-Sanitize-xname-in-read_ndx_and_attrs.patch | 39 -------------------
>  ...mon-filter-against-fnamecmp-in-recv_files.patch | 28 --------------
>  ...ailing-0-when-receiving-xattr-name-values.patch | 33 ----------------
>  package/rsync/rsync.hash                           |  5 ++-
>  package/rsync/rsync.mk                             |  2 +-
>  6 files changed, 5 insertions(+), 147 deletions(-)
>  delete mode 100644 package/rsync/0001-Check-fname-in-recv_files-sooner.patch
>  delete mode 100644 package/rsync/0002-Sanitize-xname-in-read_ndx_and_attrs.patch
>  delete mode 100644 package/rsync/0003-Check-daemon-filter-against-fnamecmp-in-recv_files.patch
>  delete mode 100644 package/rsync/0004-Enforce-trailing-0-when-receiving-xattr-name-values.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
