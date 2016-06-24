From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jun 2016 17:10:59 +0200
Subject: [Buildroot] [PATCH 12/13 v7] core/pkg-generic: reorder
 variables definitions for legal-info
In-Reply-To: <0a79662be4ed8170a4608293a294d9131cf89857.1462637351.git.yann.morin.1998@free.fr>
References: <cover.1462637351.git.yann.morin.1998@free.fr>
 <0a79662be4ed8170a4608293a294d9131cf89857.1462637351.git.yann.morin.1998@free.fr>
Message-ID: <20160624171059.33d63763@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  7 May 2016 18:14:37 +0200, Yann E. MORIN wrote:
> Move the declarations of _ACTUAL_SOURCE and _ACTUAL_SITE earlier, so
> that they are close to where _SOURCE and _SITE are handled.
> 
> This looks so far like a purely cosmetic change, but makes more sense
> with the follow-up patch, where we'll need them earlier in the file.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> ---
> Changes v2 -> v3:
>   - move that to its own patch  (Arnout)
> ---
>  package/pkg-generic.mk | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
