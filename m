From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Apr 2017 10:42:21 +0200
Subject: [Buildroot] [PATCH] trinity: fix detection of BPF features
In-Reply-To: <74ff6eb6db4f789f3f0c0048aa2c01acf09a6f7a.1492295011.git.baruch@tkos.co.il>
References: <74ff6eb6db4f789f3f0c0048aa2c01acf09a6f7a.1492295011.git.baruch@tkos.co.il>
Message-ID: <20170416104221.4797c3b4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Apr 2017 01:23:31 +0300, Baruch Siach wrote:
> Add upstream patch to detect presence of the map_flags field in bpf_attr.
> 
> Fixes:
> http://autobuild.buildroot.net/results/1d3/1d3dcb908b7bb4559e1103e09907ab043ed44679/
> http://autobuild.buildroot.net/results/269/269e1c125094b97dd9dfda0e174d2c9f3b103c3b/
> 
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
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
