From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 20 Oct 2020 06:44:19 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-10-18
In-Reply-To: <CAFOYHZDchgmMGap_YESw5C+vB2T7hOJHCjR6_Fpckc0+Ln-wNw@mail.gmail.com>
References: <5f8d3b76.1c69fb81.a6c23.a6eeSMTPIN_ADDED_MISSING@mx.google.com>
 <CAFOYHZDchgmMGap_YESw5C+vB2T7hOJHCjR6_Fpckc0+Ln-wNw@mail.gmail.com>
Message-ID: <CANQCQpYM342mSx26opoVEHCJvbQrBO0=tC0=odrpH2uDDsT4uQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chris,

On Tue, Oct 20, 2020 at 1:50 AM Chris Packham <judge.packham@gmail.com> wrote:
>
>
>
> On Mon, 19 Oct 2020, 8:08 PM Thomas Petazzoni, <thomas.petazzoni@bootlin.com> wrote:
>>
>> Hello,
>>
>> Packages with CVEs
>> ==================
>>
>> This is the list of packages for which a known CVE is affecting
>> them, which means a security vulnerability exists for
>> those packages.
>>
>>              name              |       CVE        |                             link
>> -------------------------------+------------------+--------------------------------------------------------------
>>                      syslog-ng | CVE-2008-5110    | https://security-tracker.debian.org/tracker/CVE-2008-5110
>
>
> I think this is a false positive that's a pretty old CVE.

Would you mind checking NVD
(https://nvd.nist.gov/vuln/detail/CVE-2008-5110) and making sure it
has been correctly allocated to the correct range of versions?  If it
doesn't look correct, I've captured some notes on how to update the
entry.
https://elinux.org/Buildroot:Security_Vulnerability_Management



Best Regards,
Matt
