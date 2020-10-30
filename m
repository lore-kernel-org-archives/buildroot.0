From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 30 Oct 2020 09:16:03 +0100
Subject: [Buildroot] [PATCH 2/3] package/libabseil-cpp: depend on gcc >=
 4.9
In-Reply-To: <52-5f9bc580-1-71e23380@170443290>
References: <20201029233638.78c58b98@windsurf.home>
 <52-5f9bc580-1-71e23380@170443290>
Message-ID: <20201030091603.14c1a53f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Oct 2020 08:48:17 +0100
"Michael Nosthoff" <buildroot@heine.tech> wrote:

> The build with 4.8 still fails after applying the first patch of this
> series. As this is shadowed by the C++11 error it doesn't turn up in
> the autobuilders. Should I just include a build error output into the
> commit?

Yes, and you can explained that this was shadowed by the C++11 failure,
and therefore there are no recorded autobuilder failures.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
