From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 04:15:53 +0200
Subject: [Buildroot] [PATCH V2] package/systemd: Respect
 BR2_TARGET_GENERIC_GETTY_BAUDRATE
In-Reply-To: <1457312709-6191-1-git-send-email-cyrilbur@gmail.com>
References: <1457312709-6191-1-git-send-email-cyrilbur@gmail.com>
Message-ID: <20160331041553.54f0f5a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  7 Mar 2016 12:05:09 +1100, Cyril Bur wrote:
> Currently systemd getty services ignore baudrates set in buildroot in
> favour of a hardcoded 115200. This patch SEDs out that hardcoded value with
> what is selected.
> 
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---
> V2: Address comments from Martin Bark and Maxime Hadjinlian
>     - Don't change the symlink
>     - Use qstrip (for consistency) around
>       $(BR2_TARGET_GENERIC_GETTY_BAUDRATE) in shell test statement

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
