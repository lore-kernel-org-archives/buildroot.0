From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 2 Mar 2016 18:56:29 -0300
Subject: [Buildroot] [PATCH] lksctp-tools: new package
In-Reply-To: <CAGm1_ksdcbvDerS1LUfn1=w_hvmDt8o1mQwMpGGSOzkDQY2UjA@mail.gmail.com>
References: <1456952871-14155-1-git-send-email-gustavo@zacarias.com.ar>
 <20160302222600.618f2a64@free-electrons.com>
 <56D75D35.5050201@zacarias.com.ar>
 <20160302223946.381d88ce@free-electrons.com>
 <CAGm1_ksdcbvDerS1LUfn1=w_hvmDt8o1mQwMpGGSOzkDQY2UjA@mail.gmail.com>
Message-ID: <56D7618D.7090806@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/03/16 18:50, Yegor Yefremov wrote:

> The only differences are placement, i.e. moving lksctp-tools to
> networking libraries instead of tools and adding another hook. I can
> respin v3 with these changes.
>
> Gustavo, what are you using it for? I was interested in cannelloni
> package, that depends on it.

I'm good with any of both categories since it's a grey area :)
An old zeromq (external) for sctp support, so the library.
But it's just a stop-gap until the app is moved to pgm.
Frankly i only care about the dirt left behind (source files) :P
Regards.
