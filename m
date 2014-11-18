From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Nov 2014 16:51:53 +0100
Subject: [Buildroot] Unable to boot Arm926t with big endian support
In-Reply-To: <B28B6A721CC23347BBD5566C377D30416461F28F@se-got-mb01.semcon.se>
 (Peder Alm's message of "Tue, 18 Nov 2014 15:45:45 +0000")
References: <B28B6A721CC23347BBD5566C377D30416461F1CA@se-got-mb01.semcon.se>
 <87389gr6pi.fsf@dell.be.48ers.dk>
 <B28B6A721CC23347BBD5566C377D30416461F23B@se-got-mb01.semcon.se>
 <87y4r8pqf4.fsf@dell.be.48ers.dk>
 <B28B6A721CC23347BBD5566C377D30416461F269@se-got-mb01.semcon.se>
 <87tx1wpnii.fsf@dell.be.48ers.dk>
 <B28B6A721CC23347BBD5566C377D30416461F28F@se-got-mb01.semcon.se>
Message-ID: <87ppckpkva.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peder" == Peder Alm <peder.alm@semcon.com> writes:

Hi,

 >> So big endian is only supported for ixp4xx, highbank, keystone,
 >> mvebu, vexpress and zynq.

 > As I read the Atmel documenation for my CPU it tells me that it does
 > support both little and big endian. Found this on at.com:

The CPU core may support it, but there's currently no support for
running that variant in big endian mode under Linux.

-- 
Peter Korsgaard 
