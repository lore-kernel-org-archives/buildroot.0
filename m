From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jan 2018 09:17:21 +0100
Subject: [Buildroot] [PATCH] execline: fix hash "sha" type spelling
In-Reply-To: <1515367746-46395-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1515367746-46395-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180108091721.689186fb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Jan 2018 17:29:06 -0600, Matt Weber wrote:
> sah256 -> sha256
> 
> Fixes:
> http://autobuild.buildroot.net/results/9d0/9d054a26d7833353efbe49c984a7cb66d77b1d0c/
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/execline/execline.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
