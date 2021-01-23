From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 21:35:59 +0100
Subject: [Buildroot] [PATCH] package/syslog-ng: fix build if net-snmp is
 installed on the host (again)
In-Reply-To: <20210120134008.31802-1-patrickdepinguin@gmail.com>
References: <20210120134008.31802-1-patrickdepinguin@gmail.com>
Message-ID: <20210123213559.53e3ce2e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 20 Jan 2021 14:40:07 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> See also commit 4ff6e5239240a4e1bdf73c41d6e9bff9473ec62c which describes the
> problem in detail.
> 
> The same problem now arises again, because syslog-ng renamed the
> --enable-snmp-dest option into --enable-afsnmp. See syslog-ng commit
> 4537938474771673ef5bd4a9cad7c9a7dc20b7c1, first part of 3.27.1.
> 
> Update the configure options passed from Buildroot accordingly.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  package/syslog-ng/syslog-ng.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
