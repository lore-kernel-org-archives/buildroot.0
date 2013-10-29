From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Tue, 29 Oct 2013 20:41:04 -0300
Subject: [Buildroot] Architecture build statistics
In-Reply-To: <20131029204108.5d707d09@skate>
References: <20131029204108.5d707d09@skate>
Message-ID: <20131029234103.GA2527@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 29, 2013 at 08:41:08PM +0100, Thomas Petazzoni wrote:
> 
> This e-mail is intentionally Cc'ed to a number of people who are
> working on specific architectures in Buildroot, and specifically the
> architectures having the highest number of problems in the autobuilders.
> 
> I generated some statistics of the number of failed builds vs.
> successful builds since July, 1st 2013, and here are the results
> (ordered from the worst architecture to the best one) :
> 
> +------------+---------+----------+-------+------------+------------+
> | arch       | success | failures | total | pctsuccess | pctfailure |
> +------------+---------+----------+-------+------------+------------+
> | bfin       |      10 |      607 |   617 |     1.6207 |    98.3793 |
> | microblaze |       6 |      308 |   314 |     1.9108 |    98.0892 |
> | nios2      |       2 |       49 |    51 |     3.9216 |    96.0784 |

Mind sharing what's breaking in nios2? If it's related to either libffi
or the internal toolchain, then we'll have to wait until proper support
is added upstream.

As a side note, wouldn't it be nice to have per-arch-filtering in the
autobuild status site? Going through the code quickly, I think it's just
a matter of adding a parameter to the SQL query, right?

Maybe this would help arch-maintainers to focus in what's relevant for
them?
-- 
Ezequiel Garc?a, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
