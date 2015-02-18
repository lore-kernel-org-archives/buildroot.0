From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Wed, 18 Feb 2015 09:33:47 -0600
Subject: [Buildroot] How to avoid rebuilding host-cmake
In-Reply-To: <54E4AFB4.1000705@utexas.edu>
References: <BC1FDBEC-8B34-41CB-8335-9FC413467FAC@utexas.edu>
 <CAMQcK5+EMynEMspbf6N8VAbHeJksnZg4fP5NSqRDz2smdTK4yA@mail.gmail.com>
 <54E4AFB4.1000705@utexas.edu>
Message-ID: <CAMQcK5Lzm772JCfF75ng4siZD0pKepLsEPCLJPi4+3tfJEWD1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David,

For future replies to the mailing list, please don't top post but
instead reply inline.

On Wed, Feb 18, 2015 at 9:28 AM, David Kessler <djkessler@utexas.edu> wrote:

[...]

> So, I ask about rebuilding host-cmake because it takes quite a long time,
> and it doesn't seem like it needs to be rebuilt when I'm merely adding or
> removing a package.  I suppose that is a bit of an assumption on my part....
> maybe host-cmake does indeed need to be rebuilt, depending on the package
> I've added or removed?

I think the best thing that you could do to help speed up your builds
is utilize ccache other than that you are going have to live with the
build time.

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
