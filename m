From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 12 Jul 2017 11:28:20 +0300
Subject: [Buildroot] BlueZ and Bluetooth-SIG
In-Reply-To: <650377CF-0CAE-4DF2-A6A6-9BD91D1E90D7@hella-gutmann.com>
References: <650377CF-0CAE-4DF2-A6A6-9BD91D1E90D7@hella-gutmann.com>
Message-ID: <20170712082820.ppvrxtedrv5kmevt@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Heiko,

On Wed, Jul 12, 2017 at 08:18:19AM +0000, Heiko Abraham wrote:
> I test different versions of linux-kernels (3.10, 3.12, 3.18 for 
> i.MX5/i.MX6) and BlueZ (4.101, 5.43, 5,45) but all combinations failed with 
> Bluetooth-SIG test.
> (Problems with eRTM and l2cap_disconnect for RFCOMM profile)
> 
> My assumption is, that an lot of LTS-kernel/BlueZ combinations are not 
> compliant with Bluetooth-SIG. But that is required for an BT based embedded 
> system.
> Please note, some targets required an older linux kernel for OpenGL support.
> 
> Any suggestions, how to get an buildroot build, that compliant with 
> bluetooth-sig?

Is this issue specific to Buildroot?

Does the Bluetooth-SIG compliance test succeeds on other Linux distributions?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
