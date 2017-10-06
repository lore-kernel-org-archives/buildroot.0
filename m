From: Andrey Yurovsky <yurovsky@gmail.com>
Date: Fri, 6 Oct 2017 15:39:03 -0700
Subject: [Buildroot] [PATCH 0/3] Add support for Meson build
In-Reply-To: <20170727165026.4a5f59a1@windsurf.lan>
References: <20170727094528.10745-1-joerg.krause@embedded.rocks>
 <866e116f-f9be-f138-4055-8ffe94ad2d19@imgtec.com>
 <1501150411.21202.1.camel@embedded.rocks>
 <bbae61aa-7e81-21b6-d7f8-2489b39e2893@imgtec.com>
 <20170727165026.4a5f59a1@windsurf.lan>
Message-ID: <CAAkeqgWMAYm3B72AggbyamW3C6tEd27WdfyyW=EoBx4uFNhOyw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Jul 27, 2017 at 7:50 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> No, let's wait to have a few Meson-based packages in Buildroot, and
> then we'll have a package infrastructure. This will allow us to see
> what are the commonalities, what are the differences, etc.

systemd 235 is released (https://lwn.net/Articles/735691/) and it
drops autoconf/automake and only has meson as the build system (in 234
they warned this would happen next) so perhaps that's a good starting
point for buildroot to integrate meson support? I'm happy to help out
if no one else was already working on it.
