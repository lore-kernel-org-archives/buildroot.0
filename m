From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Apr 2019 11:26:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/botan: fix build with boost
 1.70.0
In-Reply-To: <20190417225031.6190-1-fontaine.fabrice@gmail.com>
References: <20190417225031.6190-1-fontaine.fabrice@gmail.com>
Message-ID: <20190418112656.3194eba5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 18 Apr 2019 00:50:31 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/ca9dfcfd34365aa1476b718d4897a2e75f6983ac
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ompat-issue-with-upcoming-Boost-1-70.patch | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 package/botan/0002-Fix-compat-issue-with-upcoming-Boost-1-70.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
