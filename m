From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 11:16:40 +0200
Subject: [Buildroot] [PATCHv2] [autobuild] package/bwm-ng: fix build
 failures with gcc-5
In-Reply-To: <1439736791-28748-1-git-send-email-yann.morin.1998@free.fr>
References: <1439736791-28748-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150818111640.59f43f3a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 16 Aug 2015 16:53:11 +0200, Yann E. MORIN wrote:
> Bumping to the latest release, for 0.6 -> 0.6.1 to fix gcc-5 build
> failures due to incorrect definitions of 'static' functions.
> 
> The project also has a new home.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/546/546b332cf95a48412d88add2feec2ffd4712857c/
>     http://autobuild.buildroot.org/results/751/751797f3b97839f69626682ce81dca9bcb2cff22/
>     ...
> 
> Notes: the project does not provide hashes on its new location, even
> though SF.net still has the new file. But as stated on the new home,
> SF.net "will not be used anymore". And as stated by Baruch, "the dubious
> reputation of sf.net as of late, I don't think we can rely on their
> hashes in the long run". So, we only refer to the SF.net hash for
> reference, but use a locally computed, stronger sha256 as was previously
> the case.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Baruch Siach <baruch@tkos.co.il>
> 
> ---
> Changes v1 -> v2:
>   - point to SF.net for the origin of the sha1, but only use a locally
>     computed sha256  (Baruch)
> ---
>  package/bwm-ng/Config.in   | 2 +-
>  package/bwm-ng/bwm-ng.hash | 6 ++++--
>  package/bwm-ng/bwm-ng.mk   | 4 ++--
>  3 files changed, 7 insertions(+), 5 deletions(-)

Applied after removing the SF.net related comments in the hash file,
and adjusting the commit log accordingly. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
