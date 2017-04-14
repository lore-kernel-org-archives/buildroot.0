From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Apr 2017 10:59:43 +0200
Subject: [Buildroot] [PATCH] trinity: fix build BPF support is missing
In-Reply-To: <b37e7003cdb38da7844cb15345290c4d3a190d4b.1492143602.git.baruch@tkos.co.il>
References: <b37e7003cdb38da7844cb15345290c4d3a190d4b.1492143602.git.baruch@tkos.co.il>
Message-ID: <20170414105943.7540aaa0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Apr 2017 07:20:02 +0300, Baruch Siach wrote:
> Use upstream patch.
> 
> Fixes:
> http://autobuild.buildroot.net/results/2ae/2ae76fb61d017d99653d57807cb62c4d8c91ff4d/
> http://autobuild.buildroot.net/results/a53/a5391fc272f99b80974582ea735d764db8dc8e9e/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/trinity/trinity.hash | 1 +
>  package/trinity/trinity.mk   | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
