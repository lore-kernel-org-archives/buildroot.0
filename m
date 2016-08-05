From: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Date: Fri, 5 Aug 2016 13:12:49 +0530
Subject: [Buildroot] [RFC 0/2] script to find package licenses
In-Reply-To: <20160804183335.0947f9a9@free-electrons.com>
References: <1470320164-8241-1-git-send-email-rahul.bedarkar@imgtec.com>
 <20160804183335.0947f9a9@free-electrons.com>
Message-ID: <57A44379.9010208@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thursday 04 August 2016 10:03 PM, Thomas Petazzoni wrote:
> Hello,
>
> Thanks for this proposal. However, there are already some tools that do
> the same thing I believe. I'm thinking especially at the tools used by
> the Fossology project (https://www.fossology.org/). It is surely more
> complicated to install and use that your Python script, but it is also
> a lot more complete, and even more importantly: maintained by other
> people.
>

Intention of script is to help us to verify or correct legal info that 
we add in .mk file. This could be a handy tool that can be used by 
anyone when we do version bump or add new package. The complex tools 
that are available are generally used by upstream package providers for 
Open Source Compliance which provide lot more information than just file 
license. And integrating such tools in Buildroot might be difficult. But 
in Buildroot where we just need license of a package, script could be 
useful as a starting point.

Regards,

Rahul
