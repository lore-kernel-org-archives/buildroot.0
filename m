From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Nov 2016 22:34:04 +0100
Subject: [Buildroot] [PATCH] openjpeg: security bump to version 2.1.2
In-Reply-To: <08339f7ad87912d98912f4c52268b6c79ffd515c.1479156463.git.baruch@tkos.co.il>
References: <08339f7ad87912d98912f4c52268b6c79ffd515c.1479156463.git.baruch@tkos.co.il>
Message-ID: <20161114223404.7c3b88be@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Nov 2016 22:47:43 +0200, Baruch Siach wrote:
> See CHANGELOG.md for the full list of fixes, including security issues.
> 
> See CVE number lists at [1] and [2].
> 
> [1] http://advisories.mageia.org/MGASA-2016-0362.html
> [2] https://lists.fedoraproject.org/archives/list/package-announce at lists.fedoraproject.org/thread/HPMDEUIMHTLKMHELDL4F4HZ7X4Y34JEB/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/openjpeg/openjpeg.hash | 2 +-
>  package/openjpeg/openjpeg.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
