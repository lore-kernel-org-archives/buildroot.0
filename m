From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 15:08:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/tinydtls: needs host-pkgconf
In-Reply-To: <20200713222801.2461778-1-fontaine.fabrice@gmail.com>
References: <20200713222801.2461778-1-fontaine.fabrice@gmail.com>
Message-ID: <20200714150820.54ed36a7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Jul 2020 00:28:01 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add host-pkgconf dependency, it is only used to find cunit for tests
> which are disabled by default but otherwise autoreconf will fail
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/721c9feb96f93c60505a12f546a64a86b7eb36aa
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/tinydtls/tinydtls.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
