From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Oct 2017 00:25:17 +0200
Subject: [Buildroot] Buildroot autobuilder: old builds were nuked?
In-Reply-To: <b99a0950-27d7-9499-7f6a-d2a3ba1c5430@gmail.com>
References: <4881796E12491D4BB15146FE0209CE6467FA2BC3@DE02WEMBXB.internal.synopsys.com>
 <20171020212151.GA2549@scaer>
 <b99a0950-27d7-9499-7f6a-d2a3ba1c5430@gmail.com>
Message-ID: <4ee76066-e481-0791-95a8-3b4c8abf773d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-10-17 23:29, Romain Naour wrote:
> Hi All,
> 
> Le 20/10/2017 ? 23:21, Yann E. MORIN a ?crit?:
>> Alexei, All,
>>
>> On 2017-10-20 21:14 +0000, Alexey Brodkin spake thusly:
>>> I noticed that a lot of even not very old builds are absent on autobuilder.
>>> In fact only 54 most recent builds are displayed now.
>>>
>>> Probably I missed something again but is it intentional move or something went wrong?
>>
>> The latter.
>>
>> The machine on which a.b.o. runs had a fatal HDD crash right this
>> afternoon, just mere hours before Thomas ahd to take a plane.
>>
>> So it seems he managed to at least recover a working a.b.o server for the
>> time being.
>>
>> As for the data, either it is lost with the crash, or it will take
>> longer to recover/restore, but that will have to wait for Thomas to land
>> first. ;-)
>>
>> So: no, you did not miss anything, except Thomas weeping on IRC... ;-]
> 
> At least Maxime may have an old copy of the data base since it was doing some
> SQL investigation last year in Berlin IIRC.

 But I don't think there is much point restoring a year-old database. In
practice, only the recent failures are really interesting. It's a pity that the
failures referred to by commits are lost, but not a biggie IMO. And perhaps the
wayback machine still has them...


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
