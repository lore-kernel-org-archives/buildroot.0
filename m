From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2016 15:51:13 +0100
Subject: [Buildroot] [PATCH 07/16 v5] core/legal-info: install source
 archives in their own sub-dir
In-Reply-To: <a1b71dd4cfb82c9886097d5a86410831186efde9.1457718289.git.yann.morin.1998@free.fr>
References: <cover.1457718289.git.yann.morin.1998@free.fr>
 <a1b71dd4cfb82c9886097d5a86410831186efde9.1457718289.git.yann.morin.1998@free.fr>
Message-ID: <20160319155113.67227cb9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Fri, 11 Mar 2016 18:49:20 +0100, Yann E. MORIN wrote:
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

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I was about to apply this one, but it depends on the hardlink-copy
thingy, for which I had comments.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
