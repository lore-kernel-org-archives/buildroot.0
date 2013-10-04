From: Simon Dawson <spdawson@gmail.com>
Date: Fri, 4 Oct 2013 16:46:59 +0100
Subject: [Buildroot] Some legal-info observations/problems
In-Reply-To: <20131004173452.4f93d1c3@skate>
References: <CAAXf6LXHXo2vY8ns61fxoLzD0n2yzLASZqFk75xzYQwgDHp15Q@mail.gmail.com>
 <20131002172307.0d6f02ea@skate> <524C4AD4.9040902@lucaceresoli.net>
 <CAAXf6LXWf34Amx44pdixKL0m87jq_FMBxN8BJO9TBDbQ58Po1Q@mail.gmail.com>
 <524D9DE2.7090509@mind.be>
 <CAAXf6LUTTX0OFNaP4NxVWXKC4OFBROXK-PFiumL8zYrumkbtog@mail.gmail.com>
 <20131004110704.78f5b1a6@skate>
 <OFD293F65F.D1285988-ON86257BFA.00549871-86257BFA.0055339A@rockwellcollins.com>
 <20131004173452.4f93d1c3@skate>
Message-ID: <CAHt8ZCPpVROvLJ8Fb1TrtwMTLKfBcdCBDwH0k4m-QNfisPnugg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 4 October 2013 16:34, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> My suggestion in this case would be to use <pkg>_LICENSE_FILES = N/A
> (or whatever magic value is chosen) and in parallel ask the upstream
> maintainer to include the license file directly into the release
> tarballs.

This is an existing problem for the jquery package, where there is no
release tarball as such. It would be nice to be able to specify URLs
in the <pkg>_LICENSE_FILES variable.
