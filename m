From: Tudor Holton <tudor@tudorholton.com>
Date: Mon, 26 Oct 2020 19:49:03 +1100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-10-25
In-Reply-To: mid:2841
References: mid:2841
Message-ID: <b56105e96c0bfb86b803acc2ef6e0aad@tudorholton.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

The CVE listed below appears only to relate to openjdk6 and openjdk7.  
The current package builds openjdk11.0.8 or openjdk14.0.2.

openjdk6 and 7 are incredibly old now and predate both buildroot and 
OpenJDK's LTS versions.  Are they not outside the buildroot support 
window?

Cheers,
Tudor.

On 2020-10-26 19:11, Thomas Petazzoni wrote:
> Hello,
> 
> Packages with CVEs
> ==================
> 
> This is the list of packages for which a known CVE is affecting
> them, which means a security vulnerability exists for
> those packages.
> 
>              name              |       CVE        |
>          link
> -------------------------------+------------------+--------------------------------------------------------------
>                        openjdk | CVE-2013-0169    |
> https://security-tracker.debian.org/tracker/CVE-2013-0169
