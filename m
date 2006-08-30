From: Rob Landley <rob@landley.net>
Date: Wed, 30 Aug 2006 12:55:52 -0400
Subject: [Buildroot] glibc vs. uclibc
In-Reply-To: <1156787482.30424.16.camel@wallace.classdesign.local>
References: <1156787482.30424.16.camel@wallace.classdesign.local>
Message-ID: <200608301255.53182.rob@landley.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 28 August 2006 1:51 pm, Bill Somerville wrote:
> Hi
> 
> I am forced to use glibc by a closed source package from Intel (IPP) so
> I am having to use a rather dated patch from the crosstool project to
> hack with the buildroot package. This is very unsatisfactory as the
> patch only applies cleanly to a very old revision of buildroot.
> 
> Is there fresher way of using buildroot with glibc?

Buildroot started life as a test harness for uClibc.  It's maintained by the 
uClibc developers as a way of generating uClibc toolchains for various 
platforms, and building packages against uClibc.  It was only about a month 
ago that buildroot got its own mailing list rather than using the uclibc 
mailing list, and said mailing list is still "buildroot at uclibc.org".

Did this answer your question?

Rob
-- 
Never bet against the cheap plastic solution.
