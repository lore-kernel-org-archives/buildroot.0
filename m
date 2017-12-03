From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 23:28:54 +0100
Subject: [Buildroot] [PATCH 2/3] rtl8189fs: new package
In-Reply-To: <20171108194334.10031-3-geomatsi@gmail.com>
References: <20171108194334.10031-1-geomatsi@gmail.com>
 <20171108194334.10031-3-geomatsi@gmail.com>
Message-ID: <20171203232854.0e4052a7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 Nov 2017 22:43:33 +0300, Sergey Matyukevich wrote:
> This package adds the rtl8189fs WiFi driver. The driver is sourced
> from jwrdegoede's and icenowy's work on GitHub:
>    repo: https://github.com/jwrdegoede/rtl8189ES_linux.git
>    branch: rtl8189fs
> 
> Driver is known to support Realtek RTL8189FTV chip.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>  DEVELOPERS                       |  1 +
>  package/Config.in                |  1 +
>  package/rtl8189fs/Config.in      | 10 ++++++++++
>  package/rtl8189fs/rtl8189fs.hash |  2 ++
>  package/rtl8189fs/rtl8189fs.mk   | 17 +++++++++++++++++
>  5 files changed, 31 insertions(+)
>  create mode 100644 package/rtl8189fs/Config.in
>  create mode 100644 package/rtl8189fs/rtl8189fs.hash
>  create mode 100644 package/rtl8189fs/rtl8189fs.mk

Applied to master, thanks.

I wonder how many out of tree Realtek drivers are needed to support all
those Wifi chips. We already have:

package/rtl8188eu
package/rtl8189fs
package/rtl8723bs
package/rtl8723bu
package/rtl8821au

What's next ? :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
