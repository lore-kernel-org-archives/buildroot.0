From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Nov 2015 09:20:51 +0100
Subject: [Buildroot] [PATCH] package/python-protobuf: eliminate unneeded
 build-time dependencies
In-Reply-To: <CAKbGBLgzwY=CPetYU_8mn+ECxCC32-Gu2BdkSfJw3ts0JJEecQ@mail.gmail.com>
References: <CAKbGBLgXpMNaSOGgGg5nmLLdub=R44pDMWJNRGbMyErRz7NSoQ@mail.gmail.com>
 <1447002489-2373-1-git-send-email-steven@uplinklabs.net>
 <20151109220830.4c64c607@free-electrons.com>
 <CAKbGBLgfySFrLfOVySKt4e=NWUkkFOHP06reAuWJRZj9h7Cx0A@mail.gmail.com>
 <20151109231034.7b7c0c55@free-electrons.com>
 <CAKbGBLiCfaY722s1R+J8gJs8_QQqR4h0+B=dgz2UA9408sbXzw@mail.gmail.com>
 <CAKbGBLgzwY=CPetYU_8mn+ECxCC32-Gu2BdkSfJw3ts0JJEecQ@mail.gmail.com>
Message-ID: <20151110092051.6417a933@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 9 Nov 2015 17:28:58 -0800, Steven Noonan wrote:

> > Maybe, I'll think about how it could be done.
> 
> I investigated upstream's master branch state before doing too much
> and found this:
> 
> https://github.com/google/protobuf/commit/9f42f5f4a423b923f7b07ae8c5e8db4943df49c6
> 
> (It doesn't apply to 2.6.1, but this does show that protobuf 3.x will
> not have the unneeded dependency.)
> 
> So the upstream work has already been done.

Alright, thanks for looking into this. I guess your patch is then
perfectly fine in the meantime.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
