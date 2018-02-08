From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Feb 2018 23:12:36 +0100
Subject: [Buildroot] [PATCH] ltp-testsuite: add numactl as optional
 dependency
In-Reply-To: <cd25369f9e0588a17965bbabcf6214c110f86ef4.1518030288.git.baruch@tkos.co.il>
References: <cd25369f9e0588a17965bbabcf6214c110f86ef4.1518030288.git.baruch@tkos.co.il>
Message-ID: <20180208231236.371dbeb3@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  7 Feb 2018 21:04:48 +0200, Baruch Siach wrote:
> Make the detection of libnuma in the configure script consistent when
> the numactl package is enabled.
> 
> ltp-testsuite does not currently take explicit enable/disable for
> libnuma, so none are used. The next ltp-testsuite version will add these
> options.
> 
> Cc: Petr Vorel <petr.vorel@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/ltp-testsuite/ltp-testsuite.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
