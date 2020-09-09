From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Wed, 9 Sep 2020 16:32:08 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-09-06
In-Reply-To: <20200907071032.C7EB26064C@crulimr02.rockwellcollins.com>
References: <20200907071032.C7EB26064C@crulimr02.rockwellcollins.com>
Message-ID: <CAMQcK5KyWBPOW7s9BD7xaE5nd15SzEARFf8sDm9aYq=E6bqVbA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

It appears that there may be an issue with how the CVE scanning script
is working with buildroot as it is detecting that there is a CVE
vulnerability with resiprocate package when the version which is in
buildroot 1.12.0 includes this CVE fix as described in the debian
security tracker and in the nvd.nist.gov website:

https://nvd.nist.gov/vuln/detail/CVE-2017-9454

Does the automated script not handle the minor version such as "beta"
or "alpha" which is present in some of the versions listed in the
nvd.nist.gov website?

I'm not familiar with the scripts and don't have time to dig into it
but I feel like there is something missing here as I don't believe the
right fix to is put the IGNORE_CVE for this one in the package.

Thanks,
-Ryan

On Mon, Sep 7, 2020 at 2:10 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Packages with CVEs
> ==================
>
> This is the list of packages for which a known CVE is affecting
> them, which means a security vulnerability exists for
> those packages.
>
>              name              |       CVE        |                             link
> -------------------------------+------------------+--------------------------------------------------------------
>                    resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454
>
> --
> http://autobuild.buildroot.net
