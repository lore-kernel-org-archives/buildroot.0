From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Oct 2020 09:36:44 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-10-18
In-Reply-To: <CAFOYHZBPjALE07_BBEC2ZChk0zp8Y7kH5oDEjc5x-+Q1NnZu9g@mail.gmail.com>
References: <5f8d3b76.1c69fb81.a6c23.a6eeSMTPIN_ADDED_MISSING@mx.google.com>
 <CAFOYHZDchgmMGap_YESw5C+vB2T7hOJHCjR6_Fpckc0+Ln-wNw@mail.gmail.com>
 <CANQCQpYM342mSx26opoVEHCJvbQrBO0=tC0=odrpH2uDDsT4uQ@mail.gmail.com>
 <CAFOYHZBPjALE07_BBEC2ZChk0zp8Y7kH5oDEjc5x-+Q1NnZu9g@mail.gmail.com>
Message-ID: <20201021093644.4258e76d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 21 Oct 2020 20:00:53 +1300
Chris Packham <judge.packham@gmail.com> wrote:

> > Would you mind checking NVD
> > (https://nvd.nist.gov/vuln/detail/CVE-2008-5110) and making sure it
> > has been correctly allocated to the correct range of versions?  If it
> > doesn't look correct, I've captured some notes on how to update the
> > entry.
> > https://elinux.org/Buildroot:Security_Vulnerability_Management
> 
> The NVD entry looks weird it doesn't list any version range. The debian bug
> report says the affected version is 2.0.9 bulidroot is using version
> 3.29.1. I think the NVD entry is just matching any syslog-ng version. We
> should probably just add an ignore entry for it.

No, what we've been trying to do is to get the NVD database entries
fixed instead of papering over the problem. The link given by Matt
provides some details on how to report such issues to the NVD
maintainers. We have already managed to get them to fix other CVE
entries.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
