From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 9 Aug 2017 23:11:37 +0200
Subject: [Buildroot] [PATCH] uclibc: fix issue with gdb 8.0
In-Reply-To: <2ef98544-8b83-4fed-279c-e32010782be5@mind.be>
References: <20170805104858.GA31479@waldemar-brodkorb.de>
 <d8716f27-f8b8-b78b-71d3-59d6d5730153@gmail.com>
 <20170805222935.GA7270@waldemar-brodkorb.de>
 <2ef98544-8b83-4fed-279c-e32010782be5@mind.be>
Message-ID: <4826639f-7f12-d2af-d9be-da4cf57b09c1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-08-17 18:05, Arnout Vandecappelle wrote:
> 
> 
> On 06-08-17 00:29, Waldemar Brodkorb wrote:
>> Hi,
>> Romain Naour wrote,
>>
>>> Hi Waldemar,
>>>
>>> Le 05/08/2017 ? 12:49, Waldemar Brodkorb a ?crit :
>>>> gdb 8.0 is now compiled and linked with C++, the thread_db
>>>> headers need to use extern "C", to be usable for C++ code.
>>>
>>> I got the same issue with gdb-7.12.1.
>>
>> Yeah, when --disable-build-with-cxx is _not_ used the problem
>> happens even for earlier versions. May be the commit message should
>> be adjusted before pushing.
> 
>  I applied to master but forgot to update the commit message :-(

 Apparently I hadn't pushed it yet so now I did update the commit message :-)

 But this probably means there's some other patch for which I forgot to send the
'applied to master' mail.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
