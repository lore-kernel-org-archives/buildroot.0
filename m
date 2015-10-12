From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 11:09:03 +0200
Subject: [Buildroot] Change build directory por a package
In-Reply-To: <CAD7j7Q9cSriOdjNQXxamwCh8W_TCJsQ0iuYDmsEr+FJ_Az_nkQ@mail.gmail.com>
References: <CAD7j7Q9cSriOdjNQXxamwCh8W_TCJsQ0iuYDmsEr+FJ_Az_nkQ@mail.gmail.com>
Message-ID: <20151012110903.7dd3ab79@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carlos Soto,

On Sun, 11 Oct 2015 20:08:27 +0200, Carlos Soto wrote:

> I'm working on a SDL2 package for buildroot, and I'm having some problems.

There is already a sdl2 package waiting in patchwork:

  http://patchwork.ozlabs.org/patch/497394/

Instead of re-creating a package, maybe you could use this patch, and
tell us if it works for you?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
