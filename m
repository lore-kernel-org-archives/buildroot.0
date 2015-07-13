From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 17:36:12 +0200
Subject: [Buildroot] [PATCH v2 1/2] systemd: add option to enable kdbus
 support
In-Reply-To: <1428271811-27530-1-git-send-email-ryanbarnett3@gmail.com>
References: <1428271811-27530-1-git-send-email-ryanbarnett3@gmail.com>
Message-ID: <20150713173612.5951b31d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Sun,  5 Apr 2015 17:10:10 -0500, Ryan Barnett wrote:
> In the future when the kernel offically supports kdbus, this option
> should automatically enable the kernel kdbus config option(s).
> 
> Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
> ---
>  package/systemd/Config.in  | 5 +++++
>  package/systemd/systemd.mk | 6 ++++++
>  2 files changed, 11 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
