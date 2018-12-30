From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 16:56:58 +0100
Subject: [Buildroot] [PATCHv2] package/solarus: bump to version 1.6.0
In-Reply-To: <20181228152227.32542-1-romain.naour@gmail.com>
References: <20181228152227.32542-1-romain.naour@gmail.com>
Message-ID: <20181230165658.7f80e1a8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Dec 2018 16:22:27 +0100, Romain Naour wrote:
> Here are the big features in Solarus 1.6:
> 
>     * OpenGL backend and support for GLSL shaders (by Stdgregwar and Vlag)
>     * Support for external script editor of your choice.
>         Zerobrane integration: autocompletion, debug breakpoints,
>         stack inspection (by Stdgregwar)
>     * Multiple improvements in map editor, including the much-requested
>         contour generator, tile replacement and support for multiple
>         tilesets
>     * Multiple improvements in tileset editor, including multiple selection,
>         custom frame count for animated tile patterns
>     * Multiple improvements in sprite editor
>     * Data import from other quests
>     * Beautiful new free tilesets (Zoria by DragonDePlatino,
>         Ocean?s Heart by Max Mraz)
>     * Free pixel fonts (by Wekhter)
>     * Custom hero states in Lua to allow advanced customization of the hero
>     * Tons of new features in the Lua API
> 
> Last but not least: Solarus 1.6 is fully compatible with Solarus 1.5 quests.
> You have no work to do to upgrade your project to Solarus 1.6.
> 
> Starting with version 1.6, the Solarus engine now require OpenGL (GLX) support.
> The OpenGL ES support doesn't build, this issue has been reported upstream [1].
> 
> Update the download url since solarus no longer use github.
> Rebase patch.
> 
> See:
> http://www.solarus-games.org/2018/12/22/solarus-1-6-released
> 
> [1] https://gitlab.com/solarus-games/solarus/issues/1324
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> v2: add OpenGL dependency (ThomasP)
>     remove OpenGLES support for now.
> ---
>  .../solarus/0001-cmake-remove-Werror.patch    | 27 +++++++++----------
>  package/solarus/Config.in                     |  6 +++--
>  package/solarus/solarus.hash                  |  2 +-
>  package/solarus/solarus.mk                    |  7 ++---
>  4 files changed, 22 insertions(+), 20 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
