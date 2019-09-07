From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 22:16:33 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/libnspr: bump to version 4.22
In-Reply-To: <20190903101216.20337-1-giulio.benetti@micronovasrl.com>
References: <20190903101216.20337-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190907221633.355b5ed7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  3 Sep 2019 12:12:15 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> Rework all 3 patches to make that applicable to 4.22 version.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/libnspr/0001-nios2.patch      | 30 ++++++++++++------------
>  package/libnspr/0002-microblaze.patch | 32 +++++++++++++-------------
>  package/libnspr/0003-nds32.patch      | 33 +++++++++++++--------------
>  package/libnspr/libnspr.hash          |  2 +-
>  package/libnspr/libnspr.mk            |  2 +-
>  5 files changed, 49 insertions(+), 50 deletions(-)

Both patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
