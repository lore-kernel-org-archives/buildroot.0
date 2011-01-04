From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jan 2011 13:52:17 +0100
Subject: [Buildroot] Patching python to 2.7 (Thomas Petazzoni)
In-Reply-To: <000001cbac0a$1ebf6020$5c3e2060$@com>
References: <mailman.5.1294142401.15574.buildroot@busybox.net>
	<000001cbac0a$1ebf6020$5c3e2060$@com>
Message-ID: <20110104135217.5092017b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Barry,

On Tue, 4 Jan 2011 12:22:57 -0000
"Barry Bridges" <barry@disignconsultants.com> wrote:

> It must be me doing something wrong. I've seen Maxime Ripards patches but
> for some reason can't get them to work.
> 
> What version of BR would you recommend for the patches

I think 2010.11 should work, and the latest Git as well.

> and is it just a matter of adding the patches into the package/python directory?

No. You have to apply Maxime's patches to Buildroot. Maxime's patches
are not against Python itself, but against Buildroot.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
