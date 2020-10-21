From: Chris Packham <judge.packham@gmail.com>
Date: Wed, 21 Oct 2020 20:00:53 +1300
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-10-18
In-Reply-To: <CANQCQpYM342mSx26opoVEHCJvbQrBO0=tC0=odrpH2uDDsT4uQ@mail.gmail.com>
References: <5f8d3b76.1c69fb81.a6c23.a6eeSMTPIN_ADDED_MISSING@mx.google.com>
 <CAFOYHZDchgmMGap_YESw5C+vB2T7hOJHCjR6_Fpckc0+Ln-wNw@mail.gmail.com>
 <CANQCQpYM342mSx26opoVEHCJvbQrBO0=tC0=odrpH2uDDsT4uQ@mail.gmail.com>
Message-ID: <CAFOYHZBPjALE07_BBEC2ZChk0zp8Y7kH5oDEjc5x-+Q1NnZu9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 21 Oct 2020, 12:45 AM Matthew Weber, <matthew.weber@collins.com>
wrote:

> Chris,
>
> On Tue, Oct 20, 2020 at 1:50 AM Chris Packham <judge.packham@gmail.com>
> wrote:
> >
> >
> >
> > On Mon, 19 Oct 2020, 8:08 PM Thomas Petazzoni, <
> thomas.petazzoni at bootlin.com> wrote:
> >>
> >> Hello,
> >>
> >> Packages with CVEs
> >> ==================
> >>
> >> This is the list of packages for which a known CVE is affecting
> >> them, which means a security vulnerability exists for
> >> those packages.
> >>
> >>              name              |       CVE        |
>          link
> >>
> -------------------------------+------------------+--------------------------------------------------------------
> >>                      syslog-ng | CVE-2008-5110    |
> https://security-tracker.debian.org/tracker/CVE-2008-5110
> >
> >
> > I think this is a false positive that's a pretty old CVE.
>
> Would you mind checking NVD
> (https://nvd.nist.gov/vuln/detail/CVE-2008-5110) and making sure it
> has been correctly allocated to the correct range of versions?  If it
> doesn't look correct, I've captured some notes on how to update the
> entry.
> https://elinux.org/Buildroot:Security_Vulnerability_Management
>
>
>
> Best Regards,
> Matt
>

The NVD entry looks weird it doesn't list any version range. The debian bug
report says the affected version is 2.0.9 bulidroot is using version
3.29.1. I think the NVD entry is just matching any syslog-ng version. We
should probably just add an ignore entry for it.

>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201021/58414bb6/attachment.html>
