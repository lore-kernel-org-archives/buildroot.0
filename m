From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Jan 2013 14:00:38 +0100
Subject: [Buildroot] [PATCH v3 1/2] Adding yavta (Yet Another V4L2 Test
 Application) as a package
In-Reply-To: <1357822531-8938-1-git-send-email-kpa_info@yahoo.fr>
References: <1357822531-8938-1-git-send-email-kpa_info@yahoo.fr>
Message-ID: <20130110140038.404c7d92@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear kpa_info at yahoo.fr,

On Thu, 10 Jan 2013 13:55:30 +0100, kpa_info at yahoo.fr wrote:
> From: Patrick Gerber <kpa_info@yahoo.fr>
> 
> 
> Signed-off-by: Patrick Gerber <kpa_info@yahoo.fr>

For both:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Note that I did only a build test, not a runtime test. But I did the
build test with a minimal toolchains:

 * One test with a uClibc toolchain with just thread support, but no
   rpc, no ipv6, no largefile, no C++, no nothing.

 * On test with a uClibc toolchain without thread support, but with
   rpc, ipv6, largefile, C++, etc.

This should help Peter bring those packages in.

The only nitpick I could do is on the commit title. We normally do:

	yavta: new package
	media-ctl: new package

But I'm really nitpicking here :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
