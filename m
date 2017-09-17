From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Sep 2017 18:52:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: security bump
 version to 5.47
In-Reply-To: <20170916084117.11155-1-bernd.kuhls@t-online.de>
References: <20170916084117.11155-1-bernd.kuhls@t-online.de>
Message-ID: <20170917185245.6c2eac0b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Sep 2017 10:41:17 +0200, Bernd Kuhls wrote:
> Fixes CVE-2017-1000250 - All versions of the SDP server in BlueZ 5.46 and
> earlier are vulnerable to an information disclosure vulnerability which
> allows remote attackers to obtain sensitive information from the bluetoothd
> process memory.  This vulnerability lies in the processing of SDP search
> attribute requests.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/bluez5_utils/bluez5_utils.hash | 2 +-
>  package/bluez5_utils/bluez5_utils.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
