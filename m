From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 25 Jul 2017 17:16:01 -0700
Subject: [Buildroot] [PATCH] python-toml: add host variant of the package
In-Reply-To: <9493c681-b429-552a-9be4-463c77131596@mind.be>
References: <20170725045132.363-1-andrew.smirnov@gmail.com>
 <20170725214647.51f5a3b0@windsurf.home>
 <c6b0876d-b5af-a2d8-a70f-6971c1680bce@mind.be>
 <CAHQ1cqHcHShsK7YTbXsKS4JP3ueY08mTSRdscKQxALLNmzayVw@mail.gmail.com>
 <9493c681-b429-552a-9be4-463c77131596@mind.be>
Message-ID: <CAHQ1cqE4bfJSwo-GoCWT295kxUQKyxV=iah84rABYUcwRyQsqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 25, 2017 at 5:06 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 26-07-17 01:13, Andrey Smirnov wrote:
> [snip]
>> Anyway, this is a trivial patch for me to carry around, so it's no big
>> deal, but if it can be acceptable upstream in any shape or form I'd
>> love to get it there.
>
>  In fact, you can even keep this particular one in your BR2_EXTERNAL. Just
> create a file package/python-toml/python-toml.mk with just the eval line and it
> should work. And of course make sure that that file gets included.
>

Yeah, I was thinking about that as well. Sounds like the best option.

Thanks
Andrey Smirnov
