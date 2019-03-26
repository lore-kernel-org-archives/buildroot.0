From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 26 Mar 2019 23:09:40 +0100
Subject: [Buildroot] [GSoC 2019] Introduction Email - Atharva Lele
In-Reply-To: <CABM+sgq=ZdJqU0ytnZHXLo+3iEqc2HwoZtfzLaf2NXmEm2QEDg@mail.gmail.com>
References: <CABM+sgq=ZdJqU0ytnZHXLo+3iEqc2HwoZtfzLaf2NXmEm2QEDg@mail.gmail.com>
Message-ID: <fd29cc91-8323-8f8e-addc-5d8a6a194acd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Atharva,

On 17/03/2019 14:46, Atharva Lele wrote:
> Hey all,
> I am Atharva. I'm an Electronics Engineering student from Pune, India. I'm
> currently studying in my 3rd year of engineering. I'm interested in Embedded
> Systems and Linux. I'm currently interning at a startup which is working on an
> Embedded Linux OS and am working on a camera driver. I have dabbled in making a
> custom kernel for a phone (Nexus 6) and have it up on XDA-Developers.
> 
> My skills include:
> - C Programming
> - Python (Have completed Data Analyst path from dataquest.io <http://dataquest.io>)
> - Basic understanding of how the Linux Kernel works
> - Linux Camera driver architecture
> - Basics of building a root file system from scratch
> 
> My current buildroot knowledge is limited to configuring and building a root
> file system image for a given embedded system. I am working on increasing my
> knowledge of how buildroot works.

 Building a rootfs for some board and submitting a new package are great steps.

 If you want to understand more about why a build system like Buildroot exists,
Linux From Scratch is also a nice tool to learn about bootstrapping a system.


> I'm interested in two of the GSoC topics mentioned on the buildroot ideas list:
> - _Reproducible Builds_
> ? I have two of the needed skills and willing to learn about Jenkins. I also
> like the idea of reproducible builds and would love to work on it.

 Reproducible builds have not received a lot of love in Buildroot in the last
year or so, so it would definitely be great to have somebody work on that.

 You could start looking at the existing tools in Gentoo, Fedora, Debian that
evaluate reproducibility (i.e. that inject variation).

 Or you could start on your own, build some configuration, clean and build
again, and check if the images are binary identical.


> - _Follow upstream updates and CVEs of packages_
> ? Security updates are very important to me and I would love to work on tracking
> CVEs. I have worked on datasets while learning Python and I think that that
> experience will be helpful in this topic.

 It'll be more about using REST APIs of various existing online databases,
rather than working with a database itself. We only have +-2000 packages so that
still fits in a simple Python dict.


> I'd love to discuss both the ideas on IRC and hear suggestions and feedback.

 If you're still interested in doing a GSoC project for Buildroot, you'll have
to come up with a proposal eventually (by April 9). So it would be good to
launch some ideas here that we can discuss.

 Regards,
 Arnout


> Looking forward to working with all of you if I get selected.
> 
> Regards,
> Atharva Lele
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
