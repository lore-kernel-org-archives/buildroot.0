From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Oct 2017 22:33:16 +0200
Subject: [Buildroot] [PATCH] wpa_supplicant: fix upstream URL
In-Reply-To: <20171018093406.1264-1-alexander.i.mukhin@gmail.com>
References: <87d15nxr0o.fsf@dell.be.48ers.dk>
 <20171018093406.1264-1-alexander.i.mukhin@gmail.com>
Message-ID: <20171018223316.111041f8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Oct 2017 12:34:06 +0300, Alexander Mukhin wrote:
> wpa_supplicant project URL has been changed to w1.fi/wpa_supplicant.
> The old domain epitest.fi has expired.
> 
> Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
> ---
>  package/wpa_supplicant/Config.in         | 2 +-
>  package/wpa_supplicant/wpa_supplicant.mk | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
