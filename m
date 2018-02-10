From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Feb 2018 10:14:24 +0100
Subject: [Buildroot] [PATCH] libxml2: add security fix
In-Reply-To: <1f304b7afb41b9d40ca50de930b2cbd2cda740cf.1518167278.git.baruch@tkos.co.il>
References: <1f304b7afb41b9d40ca50de930b2cbd2cda740cf.1518167278.git.baruch@tkos.co.il>
Message-ID: <20180210101424.6c870f03@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  9 Feb 2018 11:07:58 +0200, Baruch Siach wrote:
> CVE-2017-8872: An attackers can cause a denial of service (buffer
> over-read) or information disclosure.
> 
> Patch from the upstream bug tracker.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libxml2/0001-CVE-2017-8872.patch | 33 ++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/libxml2/0001-CVE-2017-8872.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
