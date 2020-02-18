From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Feb 2020 18:39:27 +0100
Subject: [Buildroot] [PATCHv2] package/libxml2: add upstream security
 fix for CVE-2019-20388
In-Reply-To: <20200218093136.15834-1-patrickdepinguin@gmail.com>
References: <20200218093136.15834-1-patrickdepinguin@gmail.com>
Message-ID: <20200218183927.57c9f9e3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 18 Feb 2020 10:31:34 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> Fixes CVE-2019-20388: xmlSchemaPreRun in xmlschemas.c in libxml2 2.9.10
> allows an xmlSchemaValidateStream memory leak.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
> v2: add sob line inside patch (ThomasP)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
