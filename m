From: Georges Savoundararadj <savoundg@gmail.com>
Date: Mon, 4 Jul 2016 15:30:30 -0700
Subject: [Buildroot] [PATCH 1/1] create-boot-sd.sh: fix script for
 sfdisk (>=2.26)
In-Reply-To: <20160704220120.046a1b66@free-electrons.com>
References: <20160704002229.9354-1-savoundg@gmail.com>
 <20160704090448.20f94608@free-electrons.com>
 <8fd7392c-375c-db64-8124-04c75d0160a3@gmail.com>
 <20160704220120.046a1b66@free-electrons.com>
Message-ID: <79235d50-6982-6d22-3f43-5ce99aabb673@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 07/04/2016 01:01 PM, Thomas Petazzoni wrote:
> Hello,
>
> On Mon, 4 Jul 2016 12:44:50 -0700, Georges Savoundararadj wrote:
>
>>> As far as I can see, only the imx28evk and imx6sabre support in
>>> Buildroot still have a reference to this script. Are you using of those
>>> two platforms? If that's the case, then we would very much prefer a
>>> solution where the platform is migrated to use genimage.
>> I am using this script for the imx6sololiteevk
>> (freescale_imx6sololiteevk_defconfig)
>> platform which does not refer to this script.
> OK. What about using genimage instead then?
OK, I will send you a patch based on genimage.

Thanks,

Georges
> Thanks,
>
> Thomas
