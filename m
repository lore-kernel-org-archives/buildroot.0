From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Tue, 6 Feb 2018 18:22:01 +0100
Subject: [Buildroot] [PATCH v5 1/2] libkrb5: New package
In-Reply-To: <0c1f1d4f-ccc0-689e-315f-eb14a3d46cfd@mind.be>
References: <1517593141-26017-1-git-send-email-nerv@dawncrow.de>
 <CAH=K+6krFtqB=hj-Fe+pC6LdHKeE-uLYaSKRuvhmoO6d1Y-=9g@mail.gmail.com>
 <CAH=K+6=G1ON+qsq8Jw7drxsYFXpuAm6fnqSba0bETJLwN65fmQ@mail.gmail.com>
 <0c1f1d4f-ccc0-689e-315f-eb14a3d46cfd@mind.be>
Message-ID: <3058468c-2f38-4196-dfce-1a601affcabc@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 06.02.2018 um 14:42 schrieb Arnout Vandecappelle:
> 
> 
> On 06-02-18 14:28, Sam Voss wrote:
>> Andr?,
>>
>> On Tue, Feb 6, 2018 at 2:07 PM, Sam Voss <sam.voss@rockwellcollins.com> wrote:
>>> Andr?,
>>>
>> [snip]
>>>> +LIBKRB5_VERSION = 1.16
>>>> +LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/1.16
>>>
>>> Can the version number be taken out of the url, and instead use
>>> $(LIBKRB5_VERSION) once again here?
>>
>> I actually take this back. I went and checked and minor revisions are
>> also stored in this folder, so that will not work.
> 
>  In such a case we usually have a _VERSION_MAJOR variable that is used in the
> definition of _VERSION and _SITE.
> 
>  Regards,
>  Arnout
> 
thanks for the hint, I'll send try 6
