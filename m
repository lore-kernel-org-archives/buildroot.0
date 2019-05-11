From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sat, 11 May 2019 23:00:00 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-05-08
In-Reply-To: <decc64fc-5968-9c8a-6f0f-ca42fdbf2edb@micronovasrl.com>
References: <20190509060042.1026E872A2@whitealder.osuosl.org>
 <20190509230324.0b03746e@windsurf.home>
 <decc64fc-5968-9c8a-6f0f-ca42fdbf2edb@micronovasrl.com>
Message-ID: <52f30b47-7416-e4d1-cb63-29ee8f6c7b88@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann, All,

Il 09/05/2019 23:19, Giulio Benetti ha scritto:
>>>        aarch64 |            python-numpy-1.16.3 | NOK | http://autobuild.buildroot.net/results/50f7f09a9f830cd7b94f8fc83c09fc3d39297d3d |
>>
>> /home/buildroot/autobuild/run/instance-2/output/host/bin/aarch64-linux-gnu-gcc /tmp/tmph865w02v/tmp/tmph865w02v/source.o -L/home/buildroot/autobuild/run/instance-2/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib -lcblas -o /tmp/tmph865w02v/a.out
>> /home/buildroot/autobuild/run/instance-2/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcblas.so: undefined reference to `scnrm2_'
>> /home/buildroot/autobuild/run/instance-2/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcblas.so: undefined reference to `scasum_'
>> collect2: error: ld returned 1 exit status
>> /home/buildroot/autobuild/run/instance-2/output/host/bin/aarch64-linux-gnu-gcc /tmp/tmph865w02v/tmp/tmph865w02v/source.o -L/home/buildroot/autobuild/run/instance-2/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib -lblas -o /tmp/tmph865w02v/a.out
>> /tmp/tmph865w02v/tmp/tmph865w02v/source.o: In function `main':
>> /tmp/tmph865w02v/source.c:6: undefined reference to `cblas_ddot'
>> collect2: error: ld returned 1 exit status
>>
>> I'm not sure what's going on here. Sadly, Samuel who was maintaining
>> python-numpy, is no longer active in Buildroot. Is there anyone else
>> volunteering to have a look ?
> 
> I can try to work this out.
> 

As spoken in IRC this builds correctly with every Docker in Adam Duskett:
https://github.com/aduskett/buildroot-docker-devel

included Ubuntu 14.04(Trusty), the same as Yann's Autobuilder.

I'm waiting for Yann to report if it works for him too or not.

-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
