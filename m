From: Belisko Marek <marek.belisko@gmail.com>
Date: Tue, 15 Jan 2013 21:48:55 +0100
Subject: [Buildroot] [PATCH v2 1/6] sg3_utils: new package
In-Reply-To: <50EBD33C.1090603@mind.be>
References: <1357591399-3566-1-git-send-email-marek.belisko@open-nandra.com>
 <CAAfyv36e2Yk2kHFAq+p_BOpdz56Wa6qQaBW4zYJrq=4bnUf01Q@mail.gmail.com>
 <20130107225223.10cdf4e6@skate>
 <201301072256.26160.yann.morin.1998@free.fr>
 <50EBD33C.1090603@mind.be>
Message-ID: <CAAfyv37mJRpP+-VA6xv=c6D-i9OiNK_wakpeexMZ5-nKFSurYA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, All,

On Tue, Jan 8, 2013 at 9:05 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 07/01/13 22:56, Yann E. MORIN wrote:
>>
>> Thomas, Belisko, All,
>>
>> On Monday 07 January 2013 Thomas Petazzoni wrote:
>>>
>>> On Mon, 7 Jan 2013 22:45:50 +0100, Belisko Marek wrote:
>>>>>
>>>>> You should be work specific than just BSD and GPL. Like BSD-3c or
>>>>> BSD-4c, GPLv2, GPLv2+, GPLv3, GPLv3+, etc.
>>>>
>>>> After proper reading of COPYING file it seems it GPLv2+
>>>> "Some of the older utilities are covered by the GPL. More precisely:
>>>> You are free to distribute this software under the terms of the
>>>> GNU General Public License either version 2, or (at your option)
>>>> any later version." but in same file there is no mention about BSD
>>>> license version.
>>>
>>>
>>> There is a BSD_LICENSE file that contains a BSD three clause license,
>>
>>
>> Actually, what matters in the content of the source files. Do some of
>> them refer to either license?
>>    - if the files only refer to GPLv2+, then the BSD-3c does not apply,
>>    - if the files only refer to BSD-3c, then the GPLv2+ does not apply,
>>    - if some file refer to one or two of the licenses, then both apply.
>
>
>      - if all files refer to GPLv2+ and BSD-3c, then either applies.
>
> Putting GPLv2+ BSD-3c implies that parts are GPLv2+, other parts and BSD-3c.
> But it's also possible (and likely) that either applies.  BTW, it's not
> possible that both apply because they have conflicting terms.
Hmm what then should be in SG3_UTILS_LICENSE? I've checked files and
some of them are BSD some GPLv2.
>
>  Regards,
>  Arnout
>
>
>>
>> (/me likes how he managed to line up the above! ;-) )
>>
>> Regards,
>> Yann E. MORIN.
>>
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Thanks,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
