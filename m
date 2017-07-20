From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 23:05:46 +0200
Subject: [Buildroot] [PATCH] ipmitool: Add option to enable usb interface
In-Reply-To: <20170720012206.21094-1-sam@mendozajonas.com>
References: <20170720012206.21094-1-sam@mendozajonas.com>
Message-ID: <20170720230546.2a351c96@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Jul 2017 11:22:06 +1000, Samuel Mendoza-Jonas wrote:
> Since ipmitool v1.8.17 usb support is turned off by default. Add a
> config option to enable support for the usb interface.
> 
> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> ---
>  package/ipmitool/Config.in   | 6 ++++++
>  package/ipmitool/ipmitool.mk | 6 ++++++
>  2 files changed, 12 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
