From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jan 2011 10:01:12 +0100
Subject: [Buildroot] Patching python to 2.7
In-Reply-To: <002a01cbabeb$0d5b69b0$28123d10$@com>
References: <mailman.3.1294056002.11239.buildroot@busybox.net>
	<002a01cbabeb$0d5b69b0$28123d10$@com>
Message-ID: <20110104100112.26aed019@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 4 Jan 2011 08:40:33 -0000
"Barry Bridges" <barry@disignconsultants.com> wrote:

> Could anyone tell me if they have been successful in patching python to 2.7
> on buildroot.

Yes, Maxime Ripard has sent patches to the list that do this. I have
merged them in one of my branch, but I'm also taking that opportunity
to migrate Python to the package infrastructure, which is taking longer
than expected.

If you want, I can set up a git branch with just Maxime's patches which
are working.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
