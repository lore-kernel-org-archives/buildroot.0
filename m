From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 06 Nov 2009 20:00:10 +0100
Subject: [Buildroot] How to figure out what a package is?
In-Reply-To: <hd1qd8$kr2$1@ger.gmane.org> (Grant Edwards's message of "Fri\,
	6 Nov 2009 18\:37\:28 +0000 \(UTC\)")
References: <hd1mof$7qt$1@ger.gmane.org>
	<BD79186B4FD85F4B8E60E381CAEE190901E84907@mi8nycmail19.Mi8.com>
	<hd1otv$erv$1@ger.gmane.org>
	<d6cda7730911061024o2da77a2dy65124d3dac4d3904@mail.gmail.com>
	<hd1qd8$kr2$1@ger.gmane.org>
Message-ID: <87vdhnv5qd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:

 Grant> On 2009-11-06, Thiago A  Corr?a <thiago.correa@gmail.com> wrote:
 >> On Fri, Nov 6, 2009 at 4:12 PM, Grant Edwards <grant.b.edwards@gmail.com> wrote:
 >>> 
 >>> And the help for a package is located...
 >> 
 >> From Kconfig (ie, inside the interface from "make menuconfig")
 >> there is a Help button accessible with the arrow keys in your
 >> keyboard. "Clicking" that help button will show you the text
 >> from the help section of the Config.in

 Grant> Thanks.  I don't have buildroot installed anywhere at the
 Grant> moment, so I'm just browsing the GIT source tree to come up
 Grant> with a list of available web servers.  The list stands at

Ok, I would suggest you download buildroot and run make menuconfig,
that's a bit more userfriendly structured (E.G. web servers are located
under Networking). Remember to disable the busybox package or select
'Show packages that are also provided by busybox', as other web servers
are otherwise hidden.

-- 
Bye, Peter Korsgaard
