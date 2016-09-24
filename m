From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 24 Sep 2016 18:14:29 +0200
Subject: [Buildroot] [PATCH] package/wvstreams: add patch to fix build
 with C99 compilers
In-Reply-To: <A6BEEF15-B2C6-49FA-8D0F-A3F127248835@embedded.rocks>
References: <20160923214227.12888-1-joerg.krause@embedded.rocks>
 <9fbfd5af-6933-9b6e-6898-9bcea17e22a1@gmail.com>
 <A6BEEF15-B2C6-49FA-8D0F-A3F127248835@embedded.rocks>
Message-ID: <5017ebbe-e45d-f80c-4c75-63f5c4ff20f6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-09-16 10:47, J?rg Krause wrote:
> 
> 
> Hi Romain,
> 
> Am 24. September 2016 10:31:57 MESZ, schrieb Romain Naour <romain.naour@gmail.com>:
>> Hi J?rg,
>>
>> Le 23/09/2016 ? 23:42, J?rg Krause a ?crit :
[snip]
>>> Note, that wvstreams is not maintained anymore. Last activity was on
>>> Github was 2011, the current version 1.6.1 dates from 2009.
>>
>> Thanks for this investigation and the fix.
>> Are you using wvstreams or it's for the sake of autobuilders ?
> 
> No, I am not using wvstreams and yes, it is for the sake of autobuilders.
> 
>> I'm wondering if we should deprecate this package ?
>> Last time I looked at it, I disabled it for musl based toolchains.
>>
>> Thoughts ?
> 
> I am not sure which policy Buildroot follows here, but I would like to know.

 This is precisely the kind of situation where we start considering deprecating
a package.


 In this case, wvstreams only exists for the sake of wvdial. I don't know of
many alternatives however. modem-manager is somewhat bloaty, and chat + ppp.conf
is a lot more difficult.


 Adding Simon, the original contributor, for a second opinion.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
