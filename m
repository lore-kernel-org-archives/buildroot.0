From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Nov 2014 13:36:30 +0100
Subject: [Buildroot] Unable to boot Arm926t with big endian support
In-Reply-To: <B28B6A721CC23347BBD5566C377D30416461F1CA@se-got-mb01.semcon.se>
References: <B28B6A721CC23347BBD5566C377D30416461F1CA@se-got-mb01.semcon.se>
Message-ID: <20141118133630.650c534a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peder Alm,

On Tue, 18 Nov 2014 11:22:19 +0000, Peder Alm wrote:

> I'm trying to NFS-boot my Buildroot build for Arm926t with big endian
> support without success. I have tried Buildroot version 2013.05 and
> 2014.08 with the same result. With little endian support I can boot
> successfully for both versions. How can I fix this?

Thanks for the report. On which platform are you testing this? I do
have some ARMv7 platforms to test BE on, but not ARMv5.

Do you know if it's possible to test ARMv5 BE under Qemu for example,
so that we could reproduce those issues?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
