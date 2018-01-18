From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jan 2018 08:51:53 +0100
Subject: [Buildroot] Google Summer of Code 2018 ?
In-Reply-To: <CANQCQpa3v8pf2CvXd867Xv0e9UPCd-L+Q-9yFgZsRNdVvUnkSQ@mail.gmail.com>
References: <20180117215208.45dd61b9@windsurf>
 <CANQCQpa3v8pf2CvXd867Xv0e9UPCd-L+Q-9yFgZsRNdVvUnkSQ@mail.gmail.com>
Message-ID: <20180118085153.57f7ba35@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 Jan 2018 16:50:13 -0600, Matthew Weber wrote:

> >  - Follow upstream updates and CVEs of packages. I think this topic is
> >    still relevant, and IMO is the most interesting topic.  
> 
> I'd second that this is an interesting one (even just a manual
> approach to start with).  ie. Minimally having our legal-info (or a
> new cpe-info) generate CPE compliant tags for our packages would be a
> great addition.  Then those lists can be fed into various tools.

Could you describe in more details what are those "CPE compliant tags" ?

Ideally, what I'd like to see is a script that generates a webpage
showing for each package the current version in Buildroot, the latest
upstream version available, and whether the current version in
Buildroot is affected by CVEs. Optionally, such a script could be used
combined with the DEVELOPERS file to generate some notifications to
Buildroot developers that the packages they are looking after should
probably be upgraded (with a weekly notification, or something like
that).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
