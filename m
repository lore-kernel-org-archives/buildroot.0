From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 28 Mar 2019 10:42:33 +0100
Subject: [Buildroot] Buildroot autobuilder failures with Temporary
 failure in name resolution [was RE: [arc-buildroot]
 [autobuild.buildroot.net] Your build results for 2019-03-27]
In-Reply-To: <4881796E12491D4BB15146FE0209CE6468239D15@de02wembxa.internal.synopsys.com>
References: <4881796E12491D4BB15146FE0209CE6468239BF0@de02wembxa.internal.synopsys.com>
 <f0757f8d-72fc-e1c4-ed2a-be9cc70af311@micronovasrl.com>
 <4881796E12491D4BB15146FE0209CE6468239D15@de02wembxa.internal.synopsys.com>
Message-ID: <c30f4ace-9ea8-0e98-04c7-f6f6a9551814@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexey and Thomas,

Il 28/03/2019 10:33, Alexey Brodkin ha scritto:
> Hi Giulio,
> 
> [snip]
> 
>>> Is it a known problem?
>>
>> I've just checked it.
>> Probably it was a DNS problem due to OVH datacenter where our server is
>> located.
>>
>> I've tried to wget all 3 urls now and it works correctly.
> 
> Thanks for checking!
> Hopefully this problem goes away for good now :)

You're welcome.

**Thomas** hello first of all. Is there a way to delete autobuild false 
positive NOK?

Here is the list of NOK due to DNS problem:
http://autobuild.buildroot.net/results/d9e/d9e9aa385758cb46fad8fb46440932879b8166f7/build-end.log
http://autobuild.buildroot.net/results/338/3383a934f16d812502c9f3d23d79e4d1dc302674/build-end.log
http://autobuild.buildroot.net/results/5bd/5bd4c69f17545841622f9cf350d16b4e18422d0a/build-end.log
http://autobuild.buildroot.net/results/4b2/4b201c1476e99f5929a4b134ca74e94cd96f1771/build-end.log
http://autobuild.buildroot.net/results/937/937a1cc4d1698f95fa5281aeea999fa01491d63a/build-end.log
http://autobuild.buildroot.net/results/027/02736d014aa52138da24f311df1d10e4024176d8/build-end.log
http://autobuild.buildroot.net/results/f20/f20d6ba427f924bc0748189f32ac95602f3daa09/build-end.log
http://autobuild.buildroot.net/results/5f5/5f531fa2e4eb610b2834dcd4967903293e5ad9b0/build-end.log
http://autobuild.buildroot.net/results/c21/c210dd10d60c25b71acaaf1ade484f146be4f0d2/build-end.log
http://autobuild.buildroot.net/results/533/5337a2061db58366793787627282677b91459b64/build-end.log
http://autobuild.buildroot.net/results/343/343aee68c6e81e279a490f5c5f4e907506285007/build-end.log
http://autobuild.buildroot.net/results/882/882332ad0e806b04cc9223c5942861e611add4fa/build-end.log
http://autobuild.buildroot.net/results/a2b/a2be450bfd18610bae06c4f6745922a943bff36d/build-end.log
http://autobuild.buildroot.net/results/835/8357e25bc906fa969f3b11bb9bd5e25b180c6b78/build-end.log
http://autobuild.buildroot.net/results/7c4/7c45a9809e1de552c96a262f8e9ed9065dd063c0/build-end.log
http://autobuild.buildroot.net/results/8bc/8bc42e8e5c69c5f6206432d55a0f99365e04365f/build-end.log
http://autobuild.buildroot.net/results/6d3/6d32bc12d905edff223a2d05a593be8f0213ff4f/build-end.log
http://autobuild.buildroot.net/results/f42/f42f8fa5adb2bf7c03e2e627e37eadb956ce0c74/build-end.log
http://autobuild.buildroot.net/results/e0b/e0be247f8096d64ac172289de8ad6859ac608487/build-end.log
http://autobuild.buildroot.net/results/6a6/6a6808ef1349fd466e6bc1ea80d46655c4181f33/build-end.log
http://autobuild.buildroot.net/results/9f3/9f306a70e8961247d6a1e2f8cb8a8d1337b2c1ca/build-end.log
http://autobuild.buildroot.net/results/d26/d26a913230855ae549280d0db3e589e2bacba0bf/build-end.log
http://autobuild.buildroot.net/results/839/83913cbb28fd318c7be874c1f2c691f4b08514c2/build-end.log
http://autobuild.buildroot.net/results/bb2/bb2e4bb000c8f7d31cf37c7d765d3554e7dfe3ea/build-end.log
http://autobuild.buildroot.net/results/f74/f74e0b931515a68364dba6cbaa11929059699c9b/build-end.log
http://autobuild.buildroot.net/results/1ff/1ff92c212c8b22b8bb5ffac2c6a38db15714e0a2/build-end.log

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
