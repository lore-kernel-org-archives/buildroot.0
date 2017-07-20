From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 23:07:54 +0200
Subject: [Buildroot] [PATCH 1/1] pulseaudio: properly enable/disable
 bluez support based on package selection
In-Reply-To: <20170718085547.10828-1-ccrisan@gmail.com>
References: <20170718085547.10828-1-ccrisan@gmail.com>
Message-ID: <20170720230754.183d3c6d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Jul 2017 11:55:39 +0300, Calin Crisan wrote:
> Instead of letting the configure script automatically detect the presence of
> bluez package files, the script is now explicitly instructed to enable or
> disable bluez (both 4.x and 5.x) support based on the selection of the
> following packages: bluez_utils, bluez5_utils and sbc.
> 
> Signed-off-by: Calin Crisan <ccrisan@gmail dot com>
> ---
>  package/pulseaudio/pulseaudio.mk | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
