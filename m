From: Steven Noonan <steven@uplinklabs.net>
Date: Mon, 9 Nov 2015 14:12:38 -0800
Subject: [Buildroot] [PATCH] package/python-protobuf: eliminate unneeded
 build-time dependencies
In-Reply-To: <20151109231034.7b7c0c55@free-electrons.com>
References: <CAKbGBLgXpMNaSOGgGg5nmLLdub=R44pDMWJNRGbMyErRz7NSoQ@mail.gmail.com>
 <1447002489-2373-1-git-send-email-steven@uplinklabs.net>
 <20151109220830.4c64c607@free-electrons.com>
 <CAKbGBLgfySFrLfOVySKt4e=NWUkkFOHP06reAuWJRZj9h7Cx0A@mail.gmail.com>
 <20151109231034.7b7c0c55@free-electrons.com>
Message-ID: <CAKbGBLiCfaY722s1R+J8gJs8_QQqR4h0+B=dgz2UA9408sbXzw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 9, 2015 at 2:10 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Steven,
>
> On Mon, 9 Nov 2015 14:07:36 -0800, Steven Noonan wrote:
>
>> Upstream would make use of the lines we're removing. It's intended for
>> running their unit tests, which we don't use when building it.
>
> Can we find a way that is upstreamable, like some setup.py option or
> environment variable to disable the build/installation of unit tests?
>

Maybe, I'll think about how it could be done.
