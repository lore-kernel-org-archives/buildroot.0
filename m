From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 14:50:05 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/rtl8821au: switch to
 abperiasamy fork
In-Reply-To: <1469305720-23793-1-git-send-email-christian@paral.in>
References: <1469305720-23793-1-git-send-email-christian@paral.in>
Message-ID: <20160724145005.60926353@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Jul 2016 13:28:40 -0700, Christian Stewart wrote:
> Switching to the rtl8821au fork at github.com/abperiasamy/rtl8812AU_8821AU_linux.
> 
>  - The current fork we are using is maintained by 1 person.
>  - The current fork does not work, and there are no plans to fix this:
>      - https://github.com/ulli-kroll/rtl8821au/issues/5
>      - https://github.com/ulli-kroll/rtl8821au/issues/6
>  - In practice, the current fork has numerous instability issues.
>  - Our lab switched to the abperiasamy fork a couple months ago and have been very happy with it.
>  - The contributor list for the abperiasamy fork contains 21 well-known individuals in the community.
>  - The raspberry pi community recommends the abperiasamy fork and uses it extensively.
>  - Firmware blobs are not necessary with the new fork.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/rtl8821au/rtl8821au.hash |  2 +-
>  package/rtl8821au/rtl8821au.mk   | 15 ++++-----------
>  2 files changed, 5 insertions(+), 12 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
