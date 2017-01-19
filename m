From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Jan 2017 22:25:54 +1100
Subject: [Buildroot] [PATCH] linux-firmware: add option for Intel i915
 video cards firmware
In-Reply-To: <38042b78-d281-d26a-11f8-fbb33ca2d80a@grandegger.com>
References: <38042b78-d281-d26a-11f8-fbb33ca2d80a@grandegger.com>
Message-ID: <20170119222554.69ea1a86@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Jan 2017 17:24:23 +0100, Wolfgang Grandegger wrote:
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> ---
>  package/linux-firmware/Config.in         | 5 +++++
>  package/linux-firmware/linux-firmware.mk | 5 +++++
>  2 files changed, 10 insertions(+)

Applied to master, after adjusting the location of the option to keep
things sorted alphabetically (i915 is before radeon).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
