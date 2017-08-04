From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 4 Aug 2017 21:53:54 +0200
Subject: [Buildroot] [RFC] python-cryptography: bump to version 2.0.3
In-Reply-To: <e767c93d-4bde-bbaa-16ef-c92a97764853@mind.be>
References: <20170804052400.10360-1-yegorslists@googlemail.com>
 <CAGm1_ktaTUcbX6GSo59jqXTjV7sSON4jSjpyBNtGr--CsWRBbw@mail.gmail.com>
 <e767c93d-4bde-bbaa-16ef-c92a97764853@mind.be>
Message-ID: <CAGm1_ksXJ6Bi5gj5C=wm2vUYXMDF9hU+ym18RLc25ZhmgAWz8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 4, 2017 at 5:47 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 04-08-17 07:25, Yegor Yefremov wrote:
>> During [1] execution following error will be thrown:
>
>  I would propose then not to apply the bump until this issue is resolved, OK?
>
>  BTW, for this particular package, it would definitely be useful to have a
> runtime test (since it has many runtime dependencies, and apparently they may
> change over time).

It's on my todo list, but where do I find documentation concerning
such testing or is there any in-tree package that uses this
infrastructure?

So far I have only found the build test description: "17.20.2. How to
test your package"

Yegor
