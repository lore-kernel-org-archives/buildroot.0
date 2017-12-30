From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Dec 2017 22:36:13 +0100
Subject: [Buildroot] [PATCHv2] gitlab-ci: add .config to artefacts
In-Reply-To: <20171220141933.27736-1-yann.morin.1998@free.fr>
References: <20171220141933.27736-1-yann.morin.1998@free.fr>
Message-ID: <20171230223613.09531f66@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Dec 2017 15:19:33 +0100, Yann E. MORIN wrote:
> The defconfig is dumped at the very beginning of the build log, but the
> resulting .config is still interesting to get, in case some settings did
> not end up in there (e.g. because of the host gcc version, or because of
> conflicting settings, or because the Config.in changed without the tests
> being updated, or...).
> 
> So, add the .config to the list of artefacts to save.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> 
> ---
> Changes v1 -> v2:
>   - update .gitlab-ci.yml.in too  (Ricardo)
>   - update commit log to refer to the defconfig  (Ricardo)
>   - (s/artifact/artefact/, to use the english spelling, not the
>     american one  (Ricardo ;-] )
> ---
>  .gitlab-ci.yml    | 1 +
>  .gitlab-ci.yml.in | 1 +
>  2 files changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
