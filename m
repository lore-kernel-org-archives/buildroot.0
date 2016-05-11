From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 May 2016 23:40:37 +0200
Subject: [Buildroot] [PATCH 04/13 v7] core/legal-info: install source
 archives in their own sub-dir
In-Reply-To: <596aa96d1442410a2ffe8c28e131112c57424b91.1462637351.git.yann.morin.1998@free.fr>
References: <cover.1462637351.git.yann.morin.1998@free.fr>
 <596aa96d1442410a2ffe8c28e131112c57424b91.1462637351.git.yann.morin.1998@free.fr>
Message-ID: <20160511234037.144063f0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  7 May 2016 18:14:29 +0200, Yann E. MORIN wrote:
> Currently, we put all source archives side-by-side in the same
> directory.
> 
> Since we're about to also save individual patches that were applied
> on those sources, we don't want to make that directory a complete
> mess of unassorted files.
> 
> So, we install each source archive in its own sub-directory, where
> we'll later store the patches too. Store that location in a variable,
> so it can be re-used later on (to install patches in a future commit).
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> ---
> Changes v6 -> v7:
>   - directly call the helper

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
