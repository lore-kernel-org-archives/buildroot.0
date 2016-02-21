From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 21 Feb 2016 01:02:09 +0100
Subject: [Buildroot] [PATCH v2 05/18] erlang-rebar: bump to version 2.6.1
In-Reply-To: <20160220231928.GR3418@free.fr>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
 <1454443064-14269-6-git-send-email-fhunleth@troodon-software.com>
 <56B67620.1040700@gmail.com> <20160220183731.57f5122f@free-electrons.com>
 <20160220180803.GQ3418@free.fr> <56C8F126.1040903@mind.be>
 <20160220231928.GR3418@free.fr>
Message-ID: <56C8FE81.8040604@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/21/16 00:19, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2016-02-21 00:05 +0100, Arnout Vandecappelle spake thusly:
>> On 02/20/16 19:08, Yann E. MORIN wrote:
> [--SNIP--]
>>> Well, that's not how licensing works.
>>>
>>> Individual files have their own licenses, and they retain those licenses
>>> even when they are combined together. So, if you have two files under
>>> two licenses, like so:
>>>     file-1.c    MIT
>>>     file-2.c    Apache-2.0
>>
>>  Actually, I think it's not really the files that carry a license. It is how you
>> got it. This shows in packages that are dual licensed (i.e., with an OR), where
>> it is possible that you got it under only one of those licenses (e.g. because it
>> was combined with another work that puts constraints on it).
> 
> Again, IANAL, TTYL, and so on...
> 
> However, if some "other work" puts constraints on the file, then that
> file still retains its own license; the rights you had under that
> license are just diminished by those "constraints" of the license for
> that "other work".
> 
>>  And unfortunately, it is not very clear under which license you received the
>> code when you got it through a combined work. You _could_ claim that because you
>> received these files as part of the erlang-rebar package, you have only received
>> file-1.c under the MIT license. However, you could also claim that the
>> distributors of erlang-rebar never intended to change the license of file-1.c,
>> so that that individual file can still be used under the MIT license. So:
>> situation is not clear IMHO.
> 
> No, it's definitely not clear, as all licensing issues! :-)
> 
> Still, I think we should not take the responisibility to do such an
> in-depth licensing analysis, and that we should dtride of the safe side
> by just listing all those licenses that apply (see below).

 +1 to that.


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
