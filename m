From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 21:50:00 +0200
Subject: [Buildroot] [PATCH v2] package/efl: fix unmet dependencies
In-Reply-To: <20170508211149.1964-1-yann.morin.1998@free.fr>
References: <20170508211149.1964-1-yann.morin.1998@free.fr>
Message-ID: <20170511215000.3db4da7e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  8 May 2017 23:11:49 +0200, Yann E. MORIN wrote:
> EFL's elput selects libinput but forgot to propagate its dependencies.
> Which requires they be propagated further to a second sub-option, then
> to a third one.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Romain Naour <romain.naour@openwide.fr>
> 
> ---
> Changes v1 -> v2:
>   - porpagate dependency to comments as well  (Romain)
>   - fix commit log typoes  (Romain, me)
> ---
>  package/efl/Config.in | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)

Applied to master, after fixing the typo noticed by Romain. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
