From: Pavel Roskin <proski@gnu.org>
Date: Tue, 28 Nov 2006 17:28:11 -0500
Subject: [Buildroot] new DHCP version and make error
In-Reply-To: <25387.206.190.75.8.1164749926.squirrel@picard.linux.it>
References: <54185.206.190.75.8.1164745659.squirrel@picard.linux.it>
	<25387.206.190.75.8.1164749926.squirrel@picard.linux.it>
Message-ID: <1164752891.4016.9.camel@dv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

On Tue, 2006-11-28 at 22:38 +0100, Rafael A Barrero wrote:
> Same goes for DirectFB... DirectFB-0.9.25.1.tar.gz is no longer available,
> new version is 1.0.0-rc2.tar.gz. Thoughts?

I'd like to see buildroot become a distribution over time.  As a
distribution, every release of buildroot would provide a fixed set of
packages, perhaps with security and stability fixes added over time.
For the distribution release to remain buildable, the project would have
to mirror all the packages used in every release.

Since we are not there yet, the only solution is to keep up with the
updates.  Somebody with plenty of computing resources should build the
"full" configuration from time to time and report breakage, ideally
accompanied by the patches.

-- 
Regards,
Pavel Roskin
