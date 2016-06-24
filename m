From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jun 2016 16:22:50 +0200
Subject: [Buildroot] [PATCH 09/13 v7] core/legal-info: also save extra
 downloads
In-Reply-To: <66a5a152ccbbd6bae8f776c21d53d05c35444ad4.1462637351.git.yann.morin.1998@free.fr>
References: <cover.1462637351.git.yann.morin.1998@free.fr>
 <66a5a152ccbbd6bae8f776c21d53d05c35444ad4.1462637351.git.yann.morin.1998@free.fr>
Message-ID: <20160624162250.0fac0a17@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  7 May 2016 18:14:34 +0200, Yann E. MORIN wrote:
> Some packages, like perl, download extra files that end up as part of
> the source that Buildroot builds. Up until now, those files were not
> saved in the legal-info output.
> 
> Add those files to the legal-info output.
> 
> The unfortunate side-effect is that we will also save the secondary
> archive for the external blackfin toolchains; however, we already do
> save the binary release of some external toolchains when they do not
> provide actual source archives.
> 
> This is inherently bad, as those are not source archives, but solving
> this is a bigger concern, for another series...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> ---
> Changes v6 -> v7:
>   - directly call the wrapper
>   - fix after re-ordering patches

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
