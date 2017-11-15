From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Nov 2017 09:53:18 +0100
Subject: [Buildroot] [PATCH] genimage: change upstream URL
In-Reply-To: <1510735935.7019.123.camel@pengutronix.de>
References: <20171114174651.12184-1-vivien.didelot@savoirfairelinux.com>
 <1f1f2eba-dfd9-c253-34c1-1902c7d934ce@mind.be>
 <87zi7oo67l.fsf@weeman.i-did-not-set--mail-host-address--so-tickle-me>
 <5394fb27-6a6d-7a4d-e312-b2ad2a65510a@mind.be>
 <1510735935.7019.123.camel@pengutronix.de>
Message-ID: <d5d8f6c6-bac5-ceb4-da30-07a0045ba318@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-11-17 09:52, Jan L?bbe wrote:
> On Wed, 2017-11-15 at 09:42 +0100, Arnout Vandecappelle wrote:
>>
>> On 14-11-17 23:17, Vivien Didelot wrote:
>>> Hi Arnout,
>>>
>>> Arnout Vandecappelle <arnout@mind.be> writes:
>>>
>>>>  Since the archive still exists on Pengutronix, and there it's an
>>>> .xz instead of
>>>> a .gz, and that archive doesn't need to be AUTORECONF'ed, I think
>>>> it's better to
>>>> stick with the original archive.
>>>
>>> The http://public.pengutronix.de/software/genimage/ URL says:
>>>
>>> "Please note: The content on public.pengutronix.de is mostly
>>> temporary,
>>> so it might vanish into thin air any time. Have fun :-)"
>>
>> AFAIK that message has always been there, but still all the genimage
>> releases can be downloaded from it.
>>
>>  Maybe for the next release, Pengutronix will upload a tar.xz to
>> github? Then we can certainly switch. Now, especially the
>> AUTORECONF'ing is IMO really annoying (it will multiply the build
>> time with a factor of four for a simple config with just busybox and
>> an external toolchain).
> 
> I've just uploaded all old release tarballs to the github release page:
> https://github.com/pengutronix/genimage/releases

 I just love reactive upstreams :-)

 Vivien, will you respin?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
