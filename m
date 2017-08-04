From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 Aug 2017 22:16:05 +0200
Subject: [Buildroot] [RFC] python-cryptography: bump to version 2.0.3
In-Reply-To: <CAGm1_ksXJ6Bi5gj5C=wm2vUYXMDF9hU+ym18RLc25ZhmgAWz8g@mail.gmail.com>
References: <20170804052400.10360-1-yegorslists@googlemail.com>
 <CAGm1_ktaTUcbX6GSo59jqXTjV7sSON4jSjpyBNtGr--CsWRBbw@mail.gmail.com>
 <e767c93d-4bde-bbaa-16ef-c92a97764853@mind.be>
 <CAGm1_ksXJ6Bi5gj5C=wm2vUYXMDF9hU+ym18RLc25ZhmgAWz8g@mail.gmail.com>
Message-ID: <e6fd9630-c719-8697-ee5d-89bbe3361564@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-08-17 21:53, Yegor Yefremov wrote:
> On Fri, Aug 4, 2017 at 5:47 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>> On 04-08-17 07:25, Yegor Yefremov wrote:
>>> During [1] execution following error will be thrown:
>>
>>  I would propose then not to apply the bump until this issue is resolved, OK?
>>
>>  BTW, for this particular package, it would definitely be useful to have a
>> runtime test (since it has many runtime dependencies, and apparently they may
>> change over time).
> 
> It's on my todo list, but where do I find documentation concerning
> such testing or is there any in-tree package that uses this
> infrastructure?

 The source is the documentation! I do assume you know Python? :-P Look at
support/testing. The IPython tests are probably a good place to start.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
