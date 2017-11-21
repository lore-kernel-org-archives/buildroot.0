From: Trent Piepho <tpiepho@impinj.com>
Date: Tue, 21 Nov 2017 19:15:18 +0000
Subject: [Buildroot] [2/3] lttng-libust: bump version to 2.10.0
In-Reply-To: <CAB4xu_2SRnFad-VX0A68XCrCrrag95=+M0pJ24zYsyj4dkgcOg@mail.gmail.com>
References: <20171120232006.22588-2-eeppeliteloop@gmail.com>
 <1511291049.19578.1.camel@impinj.com>
 <CAB4xu_2SRnFad-VX0A68XCrCrrag95=+M0pJ24zYsyj4dkgcOg@mail.gmail.com>
Message-ID: <1511291718.19578.3.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2017-11-21 at 14:06 -0500, Philippe Proulx wrote:
> 
> > Looks like the hashes are for the wrong file, as the .mk is downloading
> > 2.10.0, not 2.10.0-rc2.
> 
> Oh yes I noticed this, just forgot to include the change. Sorry.
> 
> Anyway I'll be sending a v2 of this whole patchset to split the version bump of
> lttng-tools from the dlmopen() fixing patch as Thomas asked.
> 

Don't know if this is a known issue, but the current lttng-modules does
not work with kernel 4.13.  Your patch to bump the version fixed that
issue too.
