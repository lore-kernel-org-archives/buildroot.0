From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jan 2017 17:52:35 +1100
Subject: [Buildroot] [PATCH] opus: security bump to 1.1.4
In-Reply-To: <20170121134037.32421-1-peter@korsgaard.com>
References: <20170121134037.32421-1-peter@korsgaard.com>
Message-ID: <20170122175235.7f2c32d5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 Jan 2017 14:40:37 +0100, Peter Korsgaard wrote:
> Fixes CVE-2017-0381: A remote code execution vulnerability in
> silk/NLSF_stabilize.c in libopus in Mediaserver could enable an attacker
> using a specially crafted file to cause memory corruption during media file
> and data processing.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/opus/opus.hash | 2 +-
>  package/opus/opus.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
