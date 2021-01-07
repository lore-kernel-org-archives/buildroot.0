From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Jan 2021 22:57:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/boost: drop BOOST_IGNORE_CVES
In-Reply-To: <20210105171710.3835-1-fontaine.fabrice@gmail.com>
References: <20210105171710.3835-1-fontaine.fabrice@gmail.com>
Message-ID: <20210107225714.0d4c7f92@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  5 Jan 2021 18:17:10 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Not needed since commit 63332c33aa0771532807fd2684d4eee4eb952435
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/boost/boost.mk | 4 ----
>  1 file changed, 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
