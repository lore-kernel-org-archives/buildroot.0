From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Mar 2009 15:32:35 +0100
Subject: [Buildroot] Buildroot GUI
In-Reply-To: <1238163903.6667.28.camel@ess-roelvp>
References: <5077064A-237A-4F92-9395-197141542D06@cannasoftware.com>
	<1238163903.6667.28.camel@ess-roelvp>
Message-ID: <20090327153235.27e7bc22@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 27 Mar 2009 15:25:03 +0100,
Roeland Van Praet <roelvp@mind.be> a ?crit :

> As far as implementation goes, I don't think it will be difficult.
> The GUI should just be able to read the Config.in files and the tree
> structure, show the contents and generate a .config file.
> This will continue to work independently of any changes to the
> packages.

You mean just like xconfig/gconfig in the kernel source tree, which
already does that ? :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
