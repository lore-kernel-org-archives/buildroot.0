From: Drew Fustini <drew@beagleboard.org>
Date: Sun, 6 Jun 2021 23:13:48 -0700
Subject: [Buildroot] [PATCH] boot/beaglev-secondboot: update to include
 upstream fixes
In-Reply-To: <20210606072916.GD168928@scaer>
References: <20210606005122.377029-1-drew@beagleboard.org>
 <20210606072916.GD168928@scaer>
Message-ID: <20210607061348.GA1065240@x1>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jun 06, 2021 at 09:29:16AM +0200, Yann E. MORIN wrote:
> Drew, All,
> 
> On 2021-06-05 17:51 -0700, Drew Fustini spake thusly:
> > Update the commit id to include upstream fixes:
> > 
> > - Fix print format in load_and_run_ddr(e976d186e69a)
> > - Update copyright info (f2b049b7fff2)
> > - Avoid chiplink address exception (86664be28e5d)
> > 
> > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> 
> Applied to master, thanks.
> 
> Note: it would be nice if a license file were added to the repository
> with future updates. ;-)

Thank you for applying.  Yes, you are quite right that the license needs
to be added.  I will work with StarFive to get SPDX-License-Identifer
added to the source files and a LICENSE file created.  I'll post a patch
for both secondboot and ddrinit packages once that is done.

Thanks,
Drew
