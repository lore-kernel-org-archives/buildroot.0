From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 May 2014 10:36:25 +0200
Subject: [Buildroot] http://autobuild.buildroot.net/stats/ doesn't
 detect python perl luarocks infrastructures
In-Reply-To: <CAHkwnC8Aj7W4YY1qWRrAfWRnSXEKHdVeDhkXCj441D3ah_rqVA@mail.gmail.com>
References: <CAHkwnC8Aj7W4YY1qWRrAfWRnSXEKHdVeDhkXCj441D3ah_rqVA@mail.gmail.com>
Message-ID: <20140513103625.2e4e11f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Tue, 13 May 2014 10:28:53 +0200, Fabio Porcedda wrote:

> The statistics about package using infrastructures are misleading
> because it does not recognize the recently added infrastructures like:
> python, luarocks, perl.

Correct.

> Could be possible to add those new infrastructures?

Yes.

> Where is the source code that generates those pages?

http://git.buildroot.net/buildroot/tree/support/scripts/pkg-stats.

However, there is a new Python variant of this script currently in
patchwork, which is capable of comparing the Buildroot version of a
package with the upstream version. We should probably look at merging
this one at some point, but in the mean time, a quick fix to the
existing shell-based version would be OK.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
