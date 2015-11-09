From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Nov 2015 23:10:34 +0100
Subject: [Buildroot] [PATCH] package/python-protobuf: eliminate unneeded
 build-time dependencies
In-Reply-To: <CAKbGBLgfySFrLfOVySKt4e=NWUkkFOHP06reAuWJRZj9h7Cx0A@mail.gmail.com>
References: <CAKbGBLgXpMNaSOGgGg5nmLLdub=R44pDMWJNRGbMyErRz7NSoQ@mail.gmail.com>
 <1447002489-2373-1-git-send-email-steven@uplinklabs.net>
 <20151109220830.4c64c607@free-electrons.com>
 <CAKbGBLgfySFrLfOVySKt4e=NWUkkFOHP06reAuWJRZj9h7Cx0A@mail.gmail.com>
Message-ID: <20151109231034.7b7c0c55@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steven,

On Mon, 9 Nov 2015 14:07:36 -0800, Steven Noonan wrote:

> Upstream would make use of the lines we're removing. It's intended for
> running their unit tests, which we don't use when building it.

Can we find a way that is upstreamable, like some setup.py option or
environment variable to disable the build/installation of unit tests?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
