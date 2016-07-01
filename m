From: Steve Calfee <stevecalfee@gmail.com>
Date: Fri, 1 Jul 2016 10:51:41 -0700
Subject: [Buildroot] [PATCH 3/4] linux-headers: rename _AS_KERNEL to
	_FROM_KERNEL
In-Reply-To: <20160701143414.GA17666@free.fr>
References: <1461099155-30702-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 <1461099155-30702-4-git-send-email-vivien.didelot@savoirfairelinux.com>
 <20160701143414.GA17666@free.fr>
Message-ID: <CAJJ6jxsbNd-wA8pe+NE=Fw3-=RNzrivBEq5mKeumR3Ayd_Pw9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 1, 2016 at 7:34 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Vivien, All,
>
<snip>

>   - however, it's been part of a release now, and handling legacy for a
>     symbol in a choice is not easy;

I think breaking user's configurations by changing config names is
very serious and should be done for a very good reason, not just to
get a slightly clearer name.

Regards, Steve
