From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Thu, 5 Mar 2009 18:41:34 +0100
Subject: [Buildroot] iptables without IPV6
In-Reply-To: <c88e466f0903050920o60b62f7ft3f221960eb865ab@mail.gmail.com>
References: <c88e466f0903050920o60b62f7ft3f221960eb865ab@mail.gmail.com>
Message-ID: <20090305174134.GA16563@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 05, 2009 at 06:20:42PM +0100, Michel Benoit wrote:
>Hej,
>
>Has anyone been able to build iptables 1.4.1 when BR2_INET_IPV6 is not set?
>I'm performing a clean build of buildroot-2009.02 for an AT91SAM9260 target.
>
>It worked fine with an older version of buildroot and iptables (1.3.8).

http://bugzilla.netfilter.org/show_bug.cgi?id=569
