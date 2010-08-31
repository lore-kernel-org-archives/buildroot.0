From: Mitch Davis <mjd+buildroot@afork.com>
Date: Tue, 31 Aug 2010 12:00:28 +1000
Subject: [Buildroot] No compiler is embedded to the file system.
In-Reply-To: <BLU118-W21A6465BFFC320F704EC54D68A0@phx.gbl>
References: <BLU118-W21A6465BFFC320F704EC54D68A0@phx.gbl>
Message-ID: <AANLkTi=uFnF5Hwueqi1u-L_Zks=y6c9EKZBueK7FgK_6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Aug 31, 2010 at 11:04 AM, mohammed dahdouh <meodou@hotmail.com> wrote:
> in the generated file system there is no compiler (I cannot find a gcc, cc.. binaries ):

In addition to what Khem Raj wrote, there is a compiler, but it's for
running on your PC, not running on the host.  It's in output/staging,
not output/target.

Why do you need the compiler to run on your target?

Mitch.
