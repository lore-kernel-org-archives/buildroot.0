From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 10:38:34 +0200
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: remove package/sepolgen/
In-Reply-To: <20171019110446.13543-1-camh@xdna.net>
References: <20171019110446.13543-1-camh@xdna.net>
Message-ID: <20171021103834.3db0d579@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Oct 2017 22:04:46 +1100, Cam Hutchison wrote:
> The directory package/sepolgen/ was removed in commit 9d6da7a26
> (policycoreutils: split packages and bump to 2.7), but two
> entries were left in the DEVELOPERS file.
> 
> This causes the following warnings when running util/get-developers:
> WARNING: 'package/sepolgen/' doesn't match any file
> WARNING: 'package/sepolgen/' doesn't match any file
> 
> Remove the erroneous entries.
> 
> Signed-off-by: Cam Hutchison <camh@xdna.net>
> ---
>  DEVELOPERS | 2 --
>  1 file changed, 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
