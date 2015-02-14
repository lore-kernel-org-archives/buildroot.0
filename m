From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 22:08:33 +0100
Subject: [Buildroot] [PATCH 1/4] br-reproduce-build: accept BASE_GIT and
 OUTPUT_DIR from the env
In-Reply-To: <ec8f06991d8b4badd77bccbfa4d5a62aec2d83bb.1423910953.git.yann.morin.1998@free.fr>
References: <cover.1423910953.git.yann.morin.1998@free.fr>
 <ec8f06991d8b4badd77bccbfa4d5a62aec2d83bb.1423910953.git.yann.morin.1998@free.fr>
Message-ID: <20150214220833.1d7e06d8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 14 Feb 2015 11:52:03 +0100, Yann E. MORIN wrote:
> Currently, when we want to set those variables, one has to edit the
> script, so would get a conflict on the next git-pull.
> 
> Instead, allow the user to specify those variables in the environment.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  utils/br-reproduce-build | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks. Though maybe the chosen environment variable names are
a bit too generic to be globally exported in the user's .bashrc file,
for example.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
