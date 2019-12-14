From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Dec 2019 22:00:46 +0100
Subject: [Buildroot] [PATCH] package/glibc: bump version for post-2.30
 security fixes
In-Reply-To: <20191213135552.27664-1-peter@korsgaard.com>
References: <20191213135552.27664-1-peter@korsgaard.com>
Message-ID: <20191214220046.3674aa74@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 13 Dec 2019 14:55:52 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security vulnerability:
> 
> - CVE-2019-19126: ld.so failed to ignore the LD_PREFER_MAP_32BIT_EXEC
>   environment variable during program execution after a security
>   transition, allowing local attackers to restrict the possible mapping
>   addresses for loaded libraries and thus bypass ASLR for a setuid
>   program.  Reported by Marcin Ko?cielnicki.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  .../glibc.hash                                                  | 2 +-
>  package/glibc/glibc.mk                                          | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename package/glibc/{2.30-1-gbe9a328c93834648e0bec106a1f86357d1a8c7e1 => 2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91}/glibc.hash (70%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
