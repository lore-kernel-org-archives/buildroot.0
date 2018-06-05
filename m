From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 22:39:59 +0200
Subject: [Buildroot] [PATCH 1/1] dependencies.sh: add perl autodie for
 whois
In-Reply-To: <20180605181347.1992-1-fontaine.fabrice@gmail.com>
References: <20180605181347.1992-1-fontaine.fabrice@gmail.com>
Message-ID: <20180605223959.371b8700@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Jun 2018 20:13:47 +0200, Fabrice Fontaine wrote:
> Add dependency on perl autodie if whois package is selected
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/4d2ca14580cbc73f94e86ee834fac6d2541298ec
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  support/dependencies/dependencies.sh | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
