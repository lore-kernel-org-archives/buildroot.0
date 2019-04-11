From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Apr 2019 15:02:19 +0200
Subject: [Buildroot] [PATCH 1/2] package/sslh: add optional pcre
 dependency
In-Reply-To: <20190405211636.17616-1-fontaine.fabrice@gmail.com>
References: <20190405211636.17616-1-fontaine.fabrice@gmail.com>
Message-ID: <20190411150219.54f1fb34@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  5 Apr 2019 23:16:35 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> pcre dependency has been added in version 1.18 and
> https://github.com/yrutschle/sslh/commit/ab3324be477b2663196e0cc73d96aa38d59da65a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/sslh/sslh.mk | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)

Both applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
