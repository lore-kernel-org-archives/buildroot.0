From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 6 Oct 2014 20:28:39 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-10-05
In-Reply-To: <CANQCQpYo55QJoGPNcg7ZfEq5O+9qQO9f-G5wocD+NDDj=HuBRA@mail.gmail.com>
References: <20141006063013.D7B26101723@stock.ovh.net>
 <20141006094333.211d8a76@free-electrons.com>
 <CANQCQpYH7XGPbR_p2-wZqrhLMu_-GyR0HBqiwEEtgK9GX60QVg@mail.gmail.com>
 <20141006214408.2af48bbb@free-electrons.com>
 <CANQCQpaPvCgGzzukyUAASZqO9-d28Q7UwUemsjvc9xtJ5TTeKg@mail.gmail.com>
 <1412626268.2656.6.camel@abrodkin-8560l.internal.synopsys.com>
 <CANQCQpYo55QJoGPNcg7ZfEq5O+9qQO9f-G5wocD+NDDj=HuBRA@mail.gmail.com>
Message-ID: <1412627319.2656.9.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew,

On Mon, 2014-10-06 at 15:20 -0500, Matthew Weber wrote:
> Ok, good point. I wonder if it's something that could be set by
> default during the toolchain detection based on GCC >= 4.7 and
> existence of atomicops.h?

Well definitely that's possible.
You may see how it's implemented here -
http://git.buildroot.net/buildroot/tree/package/gcc/gcc.mk#n112

But
1. Are you sure that with GCC >= 4.7 atomic ops are always there?
2. I assume it is only applicable to one particular architecture?

-Alexey
