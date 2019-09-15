From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 09:58:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/sslh: fixup the 'v' prefix in
 the version
In-Reply-To: <20190911174630.648-1-fontaine.fabrice@gmail.com>
References: <20190911174630.648-1-fontaine.fabrice@gmail.com>
Message-ID: <20190915095836.024a3f2b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 11 Sep 2019 19:46:30 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> In order for the sslh version to match what is given by
> release-monitoring.org, the 'v' prefix should be encoded in
> SSLH_SOURCE and not SSLH_VERSION.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/sslh/sslh.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
