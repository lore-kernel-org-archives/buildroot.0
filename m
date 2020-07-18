From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Jul 2020 15:30:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnids: ignore CVE-2010-0751
In-Reply-To: <20200718081154.15819-1-guillaume.bressaix@gmail.com>
References: <20200718081154.15819-1-guillaume.bressaix@gmail.com>
Message-ID: <20200718153017.214d52d7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 18 Jul 2020 10:11:54 +0200
guillaume.bressaix at gmail.com wrote:

> From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
> 
> This CVE is falsely reported because it was fixed
> in package version 1.24 (which we are using).
> Ignore this CVE until the database is updated.
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---
>  package/libnids/libnids.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
