From: Chris Packham <judge.packham@gmail.com>
Date: Mon, 12 Apr 2021 20:37:46 +1200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2021-04-11
In-Reply-To: <6073d64f.1c69fb81.9d11e.7f35SMTPIN_ADDED_MISSING@mx.google.com>
References: <6073d64f.1c69fb81.9d11e.7f35SMTPIN_ADDED_MISSING@mx.google.com>
Message-ID: <CAFOYHZC23wcnW0-y=fyiP2x6M2B5CEyFEzJDeWJq_Pw5BuRbkg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 12, 2021 at 5:10 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Packages having CVEs
> ====================
>
> This is the list of packages for which a known CVE is affecting them,
> which means a security vulnerability exists for those packages.
>
> CVEs for the 'master' branch
> ----------------------------
>
>              name              |       CVE        |                             link
> -------------------------------+------------------+--------------------------------------------------------------
>                      syslog-ng | CVE-2008-5110    | https://security-tracker.debian.org/tracker/CVE-2008-5110
>

I've managed to get the CVE updated to say "This flaw affects
syslog-ng versions prior to and including 2.0.9"[1] but I'm still
getting these notifications. Is there something else that needs to
happen now? Actually nist[2] seems to know it's been modified so it
may be a case of hurry up and wait.

[1] - https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-5110
[2] - https://nvd.nist.gov/vuln/detail/CVE-2008-5110
