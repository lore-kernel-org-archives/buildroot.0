From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 25 Oct 2019 22:26:05 +0200
Subject: [Buildroot] [PATCH 3/3] package/x11r7/xserver_xorg-server:
 switch to virtual opengl provider
References: <20191023062220.5646-1-bernd.kuhls@t-online.de>
 <20191023062220.5646-3-bernd.kuhls@t-online.de>
 <20191025201055.7e357348@windsurf.dhcp.lyon.intranet>
Message-ID: <tb2c8gx64t.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 25 Oct 2019 20:10:55 +0200 schrieb Thomas Petazzoni:

> On Wed, 23 Oct 2019 08:22:20 +0200 Bernd Kuhls
> <bernd.kuhls@t-online.de> wrote:
> 
>> This allows to use xserver_xorg-server without mesa3d.
>> 
>> Build-tested using this defconfig:
>> 
>> BR2_TOOLCHAIN_BUILDROOT_GLIBC=y BR2_TOOLCHAIN_BUILDROOT_CXX=y
>> BR2_PACKAGE_XORG7=y BR2_PACKAGE_XSERVER_XORG_SERVER=y
>> BR2_PACKAGE_NVIDIA_DRIVER=y
>> 
>> Signed-off-by: Bernd Kuhls
>> <bernd.kuhls@t-online.de>
>> ---
>>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Applied to master, thanks.
> 
> Thomas

Hi Thomas,

you applied patches 1 & 3 of this series but did not commit patch 2:
http://patchwork.ozlabs.org/patch/1181847/

This will cause a build error with xserver_xorg-server as noted in the 
commit message of patch 2.

Regards, Bernd
