From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Jun 2009 16:36:32 +0200
Subject: [Buildroot] switch_root...
In-Reply-To: <23869987.post@talk.nabble.com> (nickich@abv.bg's message of
	"Thu\, 4 Jun 2009 07\:31\:35 -0700 \(PDT\)")
References: <23869987.post@talk.nabble.com>
Message-ID: <87ab4oysjz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "nickich" == nickich  <nickich@abv.bg> writes:

 nickich> Hi,

 nickich> When I use switch_root I have an error "not rootfs", which
 nickich> comes from the condition !S_ISREG(st1.st_mode). When I
 nickich> remove this condition, all seems to work fine (or at least I
 nickich> think so).

 nickich> What is this check for? 
 nickich> Can it be removed safely? 
 nickich> What's wrong with my system to break here?

Are you talking about the busybox switch_root applet? If so, then
better ask on the busybox list (busybox at busybox.net).

-- 
Bye, Peter Korsgaard
