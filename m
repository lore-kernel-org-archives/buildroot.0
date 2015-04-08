From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 16:29:05 +0200
Subject: [Buildroot] [PATCH v2] pulseview: new package
In-Reply-To: <CAMpxmJXWnzUwgM7EQ3De4OCAprJ1oFVecYMD8j+xa7dU8co1qA@mail.gmail.com>
References: <1426759708-4920-1-git-send-email-bgolaszewski@baylibre.com>
 <20150406234303.010225ea@free-electrons.com>
 <CAMpxmJXWnzUwgM7EQ3De4OCAprJ1oFVecYMD8j+xa7dU8co1qA@mail.gmail.com>
Message-ID: <20150408162905.4cfbc0a3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bartosz Golaszewski,

On Wed, 8 Apr 2015 16:07:07 +0200, Bartosz Golaszewski wrote:

> is it somehow possible to see the full build log? Pulseview can't be
> built due to:
> 
> -- checking for module 'libsigrokcxx>=0.3.0'
> --   package 'libsigrokcxx>=0.3.0' not found
> 
> I can't reproduce it with attached configs locally though and need to
> see what happens when building the C++ bindings.

No, we don't save the full build logs as they are way too large. Did
you try rebuilding exactly one of the failing configurations?

For example, building
http://autobuild.buildroot.org/results/a4e/a4ebb507798b94272bbad02456dace90472785a7/config ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
