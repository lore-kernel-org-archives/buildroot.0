From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 16:56:07 +0200
Subject: [Buildroot] [PATCH] iperf: fix file hash values
In-Reply-To: <4620ba184d19644f63c3d4d2d61cb221c9a70e12.1499173828.git.jpinto@synopsys.com>
References: <4620ba184d19644f63c3d4d2d61cb221c9a70e12.1499173828.git.jpinto@synopsys.com>
Message-ID: <20170704165607.193769d0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Jul 2017 15:53:48 +0100, Joao Pinto wrote:
> The iperf download process fails, because the hash value is not
> correct. This patch fixes the hash values for sha1 and sha256.
> 
> Signed-off-by: Joao Pinto <jpinto@synopsys.com>
> ---
>  package/iperf/iperf.hash | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/iperf/iperf.hash b/package/iperf/iperf.hash
> index 3dd491a..3e96143 100644
> --- a/package/iperf/iperf.hash
> +++ b/package/iperf/iperf.hash
> @@ -1,4 +1,4 @@
>  # From https://sourceforge.net/projects/iperf2/files/
> -sha1	9e215f6af8edd97f947f2b0207ff5487845d83d4	iperf-2.0.9.tar.gz
> +sha1	59820895df9106ba189ccfdc5677077535ad50e7	iperf-2.0.9.tar.gz
>  # Locally computed:
> -sha256  a5350777b191e910334d3a107b5e5219b72ffa393da4186da1e0a4552aeeded6  iperf-2.0.9.tar.gz
> +sha256  db02911f35686e808ed247160dfa766e08ae3f59d1e7dcedef0ffb2a6643f0bf  iperf-2.0.9.tar.gz

Thanks, but this has already been solved by commit
https://git.buildroot.org/buildroot/commit/package/iperf?id=62cf881a768c50e4c10c3dfce5b88f48beb6a26f.

Make sure to send patches on top of the latest master :)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
