From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Nov 2015 13:32:18 +0100
Subject: [Buildroot] [PATCH 2/2] package/systemd: Respect
 BR2_TARGET_GENERIC_GETTY_BAUDRATE
In-Reply-To: <1446099102-5205-2-git-send-email-cyrilbur@gmail.com>
References: <1446099102-5205-1-git-send-email-cyrilbur@gmail.com>
 <1446099102-5205-2-git-send-email-cyrilbur@gmail.com>
Message-ID: <20151105133218.2d903e55@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Cyril Bur,

On Thu, 29 Oct 2015 17:11:42 +1100, Cyril Bur wrote:
> Currently systemd getty services ignore baudrates set in buildroot in
> favour of a hardcoded 115200. This patch SEDs out that hardcoded value with
> what is selected.
> ---
>  package/systemd/systemd.mk | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Both Martin Bark and Maxime Hadjinlian raised issues about your
patches. Therefore, I have for now marked your patch as "Rejected" in
our patch tracking system. However, if you don't agree with what Martin
and Maxime said, do not hesitate to reply to them, find a solution
that works fine for everyone and post an updated patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
