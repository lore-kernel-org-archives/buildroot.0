From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 22 May 2019 23:23:31 +0200
Subject: [Buildroot] [PATCH v2 01/12] toolchain: specify GCC_BUG_85180
 is true only if GCC version < 8.x
In-Reply-To: <20190522225242.7efd830c@windsurf.home>
References: <20190521133932.81841-1-giulio.benetti@micronovasrl.com>
 <20190521133932.81841-2-giulio.benetti@micronovasrl.com>
 <20190522225242.7efd830c@windsurf.home>
Message-ID: <07ee21eb-b655-fc37-a5b4-d8d0ed8063ed@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Il 22/05/2019 22:52, Thomas Petazzoni ha scritto:
> On Tue, 21 May 2019 15:39:21 +0200
> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
> 
>> Bug 85180:
>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
>> has been fixed on Gcc version >= 8.x
>>
>> So:
>> - add 'depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8' to 'config
>>    BR2_TOOLCHAIN_HAS_GCC_BUG_85180'.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
>> ---
>>   toolchain/Config.in | 1 +
>>   1 file changed, 1 insertion(+)
> 
> Applied to master with a tweaked commit log/title. Thanks!

Thank you for rewording. Need to improve commit logs in general...

Kind regards
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

> Thomas
> 
