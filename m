From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 20 Sep 2018 19:42:04 +0200
Subject: [Buildroot] [PATCH v3 1/2] at: change upstream site,
 bump version
In-Reply-To: <CANQCQpYjOEUxq0YNUNGv0czZVGORL7Em0pnDmyZPm+CVdw1stQ@mail.gmail.com>
References: <20180918213949.36376-1-giulio.benetti@micronovasrl.com>
 <20180920165913.13488-1-giulio.benetti@micronovasrl.com>
 <20180920165913.13488-2-giulio.benetti@micronovasrl.com>
 <CANQCQpYjOEUxq0YNUNGv0czZVGORL7Em0pnDmyZPm+CVdw1stQ@mail.gmail.com>
Message-ID: <d2f50d3b-6141-3366-205f-e96b28e60f39@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 20/09/2018 19:40, Matthew Weber ha scritto:
> Giulio,
> 
> On Thu, Sep 20, 2018 at 11:59 AM Giulio Benetti
> <giulio.benetti@micronovasrl.com> wrote:
>>
>> At is now available on a git repository at:
>> https://salsa.debian.org/debian/at
>> Main changes 3.1.16 -> 3.1.23:
>> - add support for SELinux, multiple files
>> - improve atd.service, see bug report 892819
>> - fix various bugs and warnings
>> - finalized script to release software
>>
>> So:
>> - change AT_SITE_METHOD to git pointing to release/3.1.23
>> - update tarball sha256 in hash file
>> - improved S99at script:
>>    if /var/spool is linked to /tmp, .SEQ file will be lost and atd won't
>>    work neither for a live session. Create .SEQ file if not found, warning
>>    during start that after reboot atjobs could be lost.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> 
> Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
> 

Thanks!

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
