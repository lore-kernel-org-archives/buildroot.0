From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Sep 2020 21:50:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/linuxptp: bump version to 3.1
In-Reply-To: <20200928074135.21207-1-heiko.thiery@gmail.com>
References: <20200928074135.21207-1-heiko.thiery@gmail.com>
Message-ID: <20200930215053.30f3048a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 28 Sep 2020 09:41:35 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> From release note:
> 
> Version 3.1 - September 2020
> 
> This release offers substantial new functionality. Users are encouraged
> to upgrade. The most notable changes are as follows.
> 
> * Fixes non-functional NMEA mode of the ts2phc program (since 3.0)
> * Improves system time synchronization via the PTP_SYS_OFFSET_PRECISE
>   and PTP_SYS_OFFSET_EXTENDED ioctls.
> * Supports implementing a PTP GM clock by using a GPS radio or other
>   PPS time source.
> * Provides per-port statistics via the management interface.
> * Implements IEEE 1588 v2.1 slave event monitoring.
> * Adds Automotive Profile support.y
> 
>  utils/test-pkg -p linuxptp
>                              br-arm-full [1/6]: OK
>                   br-arm-cortex-a9-glibc [2/6]: OK
>                    br-arm-cortex-m4-full [3/6]: OK
>                           br-x86-64-musl [4/6]: OK
>                       br-arm-full-static [5/6]: OK
>                             sourcery-arm [6/6]: OK
> 6 builds, 0 skipped, 0 build failed, 0 legal-info failed
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  package/linuxptp/linuxptp.hash | 6 +++---
>  package/linuxptp/linuxptp.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
