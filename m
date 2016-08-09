From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 15:50:34 +0200
Subject: [Buildroot] [PATCH] linux-zigbee: fix build on musl
In-Reply-To: <1470665116-23317-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470665116-23317-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160809155034.6ce791ef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  8 Aug 2016 16:05:16 +0200, Thomas Petazzoni wrote:
> This commit adds a patch to the linux-zigbee package that fixes the
> build on musl by adding a missing <time.h> include.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/5d56f998b5c5ab9e06cf048e6ec95b8671989cef/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  ...d-config-parse.y-add-missing-time.h-inclu.patch | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/linux-zigbee/0002-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
