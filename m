From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Nov 2012 22:30:54 +0100
Subject: [Buildroot] [PATCHv2 for-2012.11 1/5] manual: trivial fixes
In-Reply-To: <CAHXCMMJWX2pWf=teZD_02P_jXws83vcfv5Vqsj4OyCsQNHaOFQ@mail.gmail.com>
References: <1354046527-13132-1-git-send-email-arnout@mind.be>
 <CAHXCMMLr9SVK7S=4k2TmtZ8+HuZecpL-Xqw5ST+kNduY4iO-Aw@mail.gmail.com>
 <50B52E36.9020604@mind.be>
 <CAHXCMMJWX2pWf=teZD_02P_jXws83vcfv5Vqsj4OyCsQNHaOFQ@mail.gmail.com>
Message-ID: <50B5310E.50903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/11/12 22:28, Samuel Martin wrote:
> 2012/11/27 Arnout Vandecappelle<arnout@mind.be>:
>> On 27/11/12 22:04, Samuel Martin wrote:
>>>
>>> Hi Arnout, all,
>>>
>>> 2012/11/27 Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>:
>>>>
> [...]
>>>> @@ -84,10 +88,17 @@ Buildroot, with the name used in the manifest file:
>>>>      GNU General Public License, version 3]
>>>>      or (at your option) any later version;
>>>>    * +GPL+:
>>>>      http://www.gnu.org/licenses/gpl.html[
>>>>      GNU General Public License] (any version);
>>>> +* +LGPLv2+:
>>>> +  http://www.gnu.org/licenses/old-licenses/lgpl-2.0.html[
>>>> +  GNU Library General Public License, version 2];
>>>> +* +LGPLv2++:
>>>
>>> You may need to use `...` instead of +...+ here.
>>
>>
>>   I don't see the issue here - it seems to work fine for me (checked
>> PDF and HTML).
> The '+' of "LGPLv2+" is outside of the inline monospace text section.

  Yes, now I see.  I'll change everything to ` in that list.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
