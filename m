From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Thu, 22 Jan 2009 10:44:52 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/multimedia/gst-plugins-good
In-Reply-To: <200901221032.29723.markus.heidelberg@web.de>
References: <20090121133322.0FFA4770FC@busybox.osuosl.org>
	<C13DBBE85AD6974B85C118C35890CA5F1AF3847E8E@EU1RDCRDC1WX029.exi.nxp.com>
	<200901221032.29723.markus.heidelberg@web.de>
Message-ID: <200901221044.52834.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markus Heidelberg, 22.01.2009:
> Daniel James Laird, 22.01.2009:
> 
> BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_JPEG -> BR2_PACKAGE_GST_PLUGINS_GOOD_JPEG
> BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PNG  -> BR2_PACKAGE_GST_PLUGINS_GOOD_PNG
> 
> > Disable ESD and OSS automatically in .mk file (as not yet available in
> > buildroot)
> 
> Yes.

Oh, wait. Why did I say so? Rubbish. I used osssink myself. I just
didn't thought about it. I didn't find a package that could be a
dependency, but of course the kernel headers are. So if the osssink
plugin causes problems for you (OSS disabled in the kernel config?),
please keep it as a config option. What should be used as dependency?
Nothing, just a note?

Markus
