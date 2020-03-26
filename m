From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Mar 2020 22:29:46 +0100
Subject: [Buildroot] [PATCH] package/syslog-ng: update patch that fixes
 --with-net-snmp
In-Reply-To: <20200325093826.26221-1-patrickdepinguin@gmail.com>
References: <20200325093826.26221-1-patrickdepinguin@gmail.com>
Message-ID: <20200326222946.4bf86dfb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 25 Mar 2020 10:38:26 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> The final solution accepted upstream differs from the local patch applied
> earlier in Buildroot (commit 4ff6e5239240a4e1bdf73c41d6e9bff9473ec62c).
> 
> Update the local code accordingly.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  .../0002-configure.ac-fix-with-netsnmp.patch  | 44 +++++++++++--------
>  package/syslog-ng/syslog-ng.mk                |  2 +-
>  2 files changed, 27 insertions(+), 19 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
