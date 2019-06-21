From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Fri, 21 Jun 2019 11:22:00 +0200
Subject: [Buildroot] [PATCH 21/27] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_90620
In-Reply-To: <20190620181408.308b4443@windsurf>
References: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
 <20190614210346.121013-22-giulio.benetti@micronovasrl.com>
 <20190620181408.308b4443@windsurf>
Message-ID: <a74261b8-c5b7-86a5-4a56-479247f92da4@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Il 20/06/2019 18:14, Thomas Petazzoni ha scritto:
> On Fri, 14 Jun 2019 23:03:40 +0200
> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
> 
>> GCC fails on building haproxy for the Microblaze Arch:
>> http://autobuild.buildroot.org/results/64706f96db793777de9d3ec63b0a47d776cf33fd/build-end.log
>>
>> Originally reported for gpsd:

I've just realized that is not originally reported for gpsd and...

>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90620
>>
>> Fixed on Gcc 8.x but regressed in Gcc 9.x.

I've messed up with all these patches, since there is a patch that fixes
this patch:
https://patchwork.ozlabs.org/patch/1117724/

Sorry, but they were a lot of patches and I missed to squash them into 
only one.

Best regards
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

>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> ---
>>   toolchain/Config.in | 8 ++++++++
>>   1 file changed, 8 insertions(+)
> 
> Applied to master, thanks.
> 
> Thomas
> 
