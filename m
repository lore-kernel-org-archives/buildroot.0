From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 Aug 2017 17:47:24 +0200
Subject: [Buildroot] [RFC] python-cryptography: bump to version 2.0.3
In-Reply-To: <CAGm1_ktaTUcbX6GSo59jqXTjV7sSON4jSjpyBNtGr--CsWRBbw@mail.gmail.com>
References: <20170804052400.10360-1-yegorslists@googlemail.com>
 <CAGm1_ktaTUcbX6GSo59jqXTjV7sSON4jSjpyBNtGr--CsWRBbw@mail.gmail.com>
Message-ID: <e767c93d-4bde-bbaa-16ef-c92a97764853@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-08-17 07:25, Yegor Yefremov wrote:
> During [1] execution following error will be thrown:

 I would propose then not to apply the bump until this issue is resolved, OK?

 BTW, for this particular package, it would definitely be useful to have a
runtime test (since it has many runtime dependencies, and apparently they may
change over time).

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
