From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 22:41:39 +0200
Subject: [Buildroot] [PATCH] package/wvstreams: mark as deprecated
In-Reply-To: <1475923059-7328-1-git-send-email-romain.naour@gmail.com>
References: <1475923059-7328-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20161009224139.640c124d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  8 Oct 2016 12:37:39 +0200, Romain Naour wrote:
> As reported by J?rg and I [1] [2], wvstreams is not maintained anymore. Last
> activity was on Github was 2011, the current version 1.6.1 dates from 2009.
> 
> Also it doesn't build anymore with a recent compiler (gcc5 and gcc6).
> Instead of stacking patches forever, mark this wvstreams and wvdial deprecated
> before removing them completely.
> 
> Remove following failures from autobuilders.
> http://autobuild.buildroot.net/results/f01/f0166f030875ecaf0d757790de6361339071831e
> http://autobuild.buildroot.net/results/32b/32b4eba8c7cbe8a3b1cde2d67f1af3f913fcc292
> http://autobuild.buildroot.net/results/38f/38fefa126596c6e267ffaf0f2dd9c5e3dcf09aff
> http://autobuild.buildroot.net/results/ea2/ea223c8a4f817541f55aa36c47b159a316031bff
> 
> [1] http://patchwork.ozlabs.org/patch/674238/
> [2] http://patchwork.ozlabs.org/patch/505304/
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Simon Dawson <spdawson@gmail.com>
> Cc: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/wvdial/Config.in    | 2 ++
>  package/wvstreams/Config.in | 2 ++
>  2 files changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
