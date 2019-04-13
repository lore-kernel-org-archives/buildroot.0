From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sat, 13 Apr 2019 11:02:04 +0200
Subject: [Buildroot] [PATCH v2] package/qt5/qt5virtualkeyboard: fix
 legal-info failure
In-Reply-To: <10b83cfa-857e-0337-027f-393da6fd34bd@mind.be>
References: <4549a443-50cb-3a96-a390-4b68b6328f76@micronovasrl.com>
 <20190412082455.65397-1-giulio.benetti@micronovasrl.com>
 <4f3d6cf0-7cdd-ce66-eda7-d1e038c8e1df@mind.be>
 <5d8bbfe9-6954-ce89-6b54-d81939fd3fd7@micronovasrl.com>
 <10b83cfa-857e-0337-027f-393da6fd34bd@mind.be>
Message-ID: <9811e8ac-fae0-859b-bc85-fba814e36d11@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 13/04/2019 09:39, Arnout Vandecappelle ha scritto:
> 
> 
> On 12/04/2019 23:51, Giulio Benetti wrote:
>> Hello Arnout,
>>
>> Il 12/04/2019 23:26, Arnout Vandecappelle ha scritto:
>>>
>>>
>>> On 12/04/2019 10:24, Giulio Benetti wrote:
>>>> After version bump, all sha256 were updated, but not the changed license
>>>> files paths for version 5.12.2.
>>>>
>>>> Update license files paths for 5.12.2.
>>>>
>>>> Fixes:
>>>> http://autobuild.buildroot.net/results/3812f4a6313fab57766c7b98defa723c58a8fa76/
>>>>
>>>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>>>> ---
>>>>  ? .../5.12.2/qt5virtualkeyboard.hash???????????????? |? 8 ++++----
>>>>  ? .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk?? | 14 +++++++++++++-
>>>>  ? 2 files changed, 17 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/package/qt5/qt5virtualkeyboard/5.12.2/qt5virtualkeyboard.hash
>>>> b/package/qt5/qt5virtualkeyboard/5.12.2/qt5virtualkeyboard.hash
>>>> index 69c947359a..245f2b4a70 100644
>>>> --- a/package/qt5/qt5virtualkeyboard/5.12.2/qt5virtualkeyboard.hash
>>>> +++ b/package/qt5/qt5virtualkeyboard/5.12.2/qt5virtualkeyboard.hash
>>>> @@ -3,7 +3,7 @@ sha256
>>>> 7111de5c78f8a0d29394409727647b90ae5906fd5105c843af98c3ae3804248d qtvirtua
>>>>  ? ? # Hashes for license files:
>>>>  ? sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903
>>>> LICENSE.GPL3
>>>> -sha256 7a45a9769d19545480a241230e6ea520b5156fac00930dcd69b6886749743d10
>>>> src/virtualkeyboard/3rdparty/lipi-toolkit/MIT_LICENSE.txt
>>>> -sha256 05cc719deafd0ab083b03296bb2911de10d116953b626a7629b9ca59938038b1
>>>> src/virtualkeyboard/3rdparty/openwnn/NOTICE
>>>> -sha256 b5830d96fb5a7e7e7ebcc295f352846b4b998e78fdc8f9aa68e134d2e4b39986
>>>> src/virtualkeyboard/3rdparty/pinyin/NOTICE
>>>> -sha256 9400a6128693d2f25653698e695f554660c71efccc8c21af28bf143e35199db6
>>>> src/virtualkeyboard/3rdparty/tcime/COPYING
>>>
>>>  ? Shouldn't these still be kept for the 5.6 version? Maybe with a comment above.
>>
>> Version 5.6 uses qt5virtualkeyboard 2.0 that has differently located license
>> files, so they have their sha256 in
>> package/qt5/qt5virtualkeyboard/2.0/qt5virtualkeyboard.hash
> 
>   Oops, of course, you're right. Sorry for the noise.

No problem!

Best regards.
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
>>
>> I've succesfully built qt5virtualkeyboard-legal-info for both 5.6 and
>> latest(5.12.2)
>>
>> Kind regards
>>
