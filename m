From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 17:10:19 +0100
Subject: [Buildroot] [PATCH 2/2] package/wget: add optional dependency
 on pcre/pcre2
In-Reply-To: <23f351ac07ecded68a036df8d9eb35e63076f978.1545977060.git.baruch@tkos.co.il>
References: <8e7b99203d2d931a90f1386c9cbd7823e1bcc647.1545977060.git.baruch@tkos.co.il>
 <23f351ac07ecded68a036df8d9eb35e63076f978.1545977060.git.baruch@tkos.co.il>
Message-ID: <20181230171019.6fdb10f6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Dec 2018 08:04:20 +0200, Baruch Siach wrote:
> Default to pcre2 to mimic upstream configure.ac.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/wget/wget.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
