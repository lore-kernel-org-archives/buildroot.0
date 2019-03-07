From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Mar 2019 22:10:29 +0100
Subject: [Buildroot] [PATCH v1 1/2] package/busybox: udhcp
 CVE-2018-20679 patch
In-Reply-To: <20190306142231.23490-1-jared.bents@rockwellcollins.com>
References: <20190306142231.23490-1-jared.bents@rockwellcollins.com>
Message-ID: <20190307221029.79cb8f09@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  6 Mar 2019 08:22:30 -0600
jared.bents at rockwellcollins.com wrote:

> From: Jared Bents <jared.bents@rockwellcollins.com>
> 
> Patch to resolve CVE-2018-20679 which affects versions prior
> to 1.30.0
> 
> More information can be found at:
> https://nvd.nist.gov/vuln/detail/CVE-2018-20679
> 
> This applies to both master and 2019.02
> 
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> ---
>  ...tions-are-indeed-4-byte-closes-11506.patch | 136 ++++++++++++++++++
>  1 file changed, 136 insertions(+)
>  create mode 100644 package/busybox/0004-udhcpc-check-that-4-byte-options-are-indeed-4-byte-closes-11506.patch

I've applied both to master, because it makes them to have them to
backport to 2019.02. However, for master, a followup patch doing an
update to 1.30.1 would be good.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
