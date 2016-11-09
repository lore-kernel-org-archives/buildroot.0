From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 22:51:05 +0100
Subject: [Buildroot] [PATCH v4 01/22] Use already qstripped
 BR2_TOOLCHAIN_EXTERNAL_PREFIX everywhere
In-Reply-To: <20161107012017.22505-2-arnout@mind.be>
References: <20161107012017.22505-1-arnout@mind.be>
 <20161107012017.22505-2-arnout@mind.be>
Message-ID: <20161109225105.67da6986@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 7 Nov 2016 02:19:56 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The BR2_TOOLCHAIN_EXTERNAL_PREFIX variable is already qstripped and
> stored in the TOOLCHAIN_EXTERNAL_PREFIX variable in
> toolchain-external.mk, so use this variable everywhere.
> 
> This will be useful for a later patch that makes the derivation of
> TOOLCHAIN_EXTERNAL_PREFIX a little more complex.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> [Arnout: split off into separate patch]
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> v4: split off into separate patch [Arnout]
> ---
>  package/Makefile.in  | 2 +-
>  package/wine/wine.mk | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
