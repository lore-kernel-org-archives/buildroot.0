From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 12 Feb 2016 23:04:22 -0200
Subject: [Buildroot] Analysis of build failures
References: <mailman.19.1455278403.3863.buildroot@busybox.net>
Message-ID: <56be8116e709c_bb8cf3dac1595b@ultri2.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Fri, 12 Feb 2016 10:45:41 +0100, Thomas Petazzoni wrote:
>> microblazeel |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/44dd45e0f693ea84fc072ab28f038bf04a9226ec/
> 
> oslib/libmtd.h:288:8: error: unknown type name 'uint8_t'
> 
> Anyone ?
> 
>>      powerpc |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/dc75b1f5ca4db5fb4658f19fde56b18cb7170fe9/
> 
> Same.

There is a patch upstream for this.
http://git.kernel.dk/?p=fio.git;a=patch;h=d7bb6180f831091c468e5aa749b142efd5eddda4
http://patchwork.ozlabs.org/patch/582346/

*Really sorry* the spam sending the patch.

Regards,
Ricardo
