From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Jul 2017 18:03:32 +0200
Subject: [Buildroot] [PATCH 7/7] toolchain-external: default
 BR2_TOOLCHAIN_EXTERNAL_PATH to empty
In-Reply-To: <20170709232123.30120-8-arnout@mind.be>
References: <20170709232123.30120-1-arnout@mind.be>
 <20170709232123.30120-8-arnout@mind.be>
Message-ID: <20170710180332.105dfb2b@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Jul 2017 01:21:23 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> It makes no sense to default to an arbitrary path. In addition, it in
> fact works correctly when it is empty. In that case, the toolchain will
> be searched in PATH.
> 
> Update the help text to explain the above, and also that the compiler
> is supposed to be in the bin subdirectory.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  toolchain/toolchain-external/Config.in | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
