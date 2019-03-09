From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Mar 2019 21:47:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/sqlcipher: fix static build
In-Reply-To: <20190309162815.24868-1-fontaine.fabrice@gmail.com>
References: <20190309162815.24868-1-fontaine.fabrice@gmail.com>
Message-ID: <20190309214714.6d46a717@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  9 Mar 2019 17:28:15 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/ebd8678a56a7dd8679fd4ec3ca1385c04866cc88
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/sqlcipher/sqlcipher.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
