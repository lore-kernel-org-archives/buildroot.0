From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Oct 2017 23:21:47 +0200
Subject: [Buildroot] [PATCH 0/3] Add support for Meson build
In-Reply-To: <8186cfc2-f587-8d35-2560-2f2f314a186d@mind.be>
References: <20170727094528.10745-1-joerg.krause@embedded.rocks>
 <866e116f-f9be-f138-4055-8ffe94ad2d19@imgtec.com>
 <1501150411.21202.1.camel@embedded.rocks>
 <bbae61aa-7e81-21b6-d7f8-2489b39e2893@imgtec.com>
 <20170727165026.4a5f59a1@windsurf.lan>
 <CAAkeqgWMAYm3B72AggbyamW3C6tEd27WdfyyW=EoBx4uFNhOyw@mail.gmail.com>
 <20171007135843.5a75c7f5@windsurf.home>
 <7d11c269-d453-6066-e6f1-2f68dd4b81d3@smile.fr>
 <CAAkeqgV=snat2dr7MpHOc9HE4MWf5eqHX3HJQVR6P+BZb5WN1w@mail.gmail.com>
 <8186cfc2-f587-8d35-2560-2f2f314a186d@mind.be>
Message-ID: <20171011232147.4206a377@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 Oct 2017 22:38:39 +0200, Arnout Vandecappelle wrote:

>  Yes, our original idea was that there should be a few packages using meson
> before we add an infra for it. But since there are quite a few packages that
> will use the meson infra, and since it seems pretty straightforward, it can
> indeed be done right away (at least according to me, Thomas may have a different
> opinion).

Yes, I believe it's fine to have a Meson package infrastructure right
away. There is a clear trend towards using Meson, so I'm fine with
merging a package infrastructure for it.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
