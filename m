From: Jean-Claude Gervais <jc.gervais@videotron.ca>
Date: Wed, 14 Nov 2007 16:22:45 -0500
Subject: [Buildroot] I think I'm in love! And
	other	newbie-type	questions...
In-Reply-To: <fhfl84$mtf$1@ger.gmane.org>
References: <1195065229.17103.13.camel@mercury.sprymusic>
	<fhfl84$mtf$1@ger.gmane.org>
Message-ID: <1195075365.17103.31.camel@mercury.sprymusic>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Janne,

By reading the mailing list archives, I think I understand the problem;
When configuring Buildroot, you must specify the path to your
kernel .config file.

This is in the Buildroot 'make menuconfig' options 

Kernel --->
    () .config file

If the value between parentheses is empty, then you must supply the path
to the .config file you want to use.

At least I think that's it.
Hope that helps.
J

On Wed, 2007-11-14 at 22:19 +0200, Janne Kario wrote:
> Jean-Claude Gervais wrote:
> 
> > cp: missing destination file operand after
> > `/home/jgervais/Desktop/sandboxes/buildroot/project_build_arm/uclibc/linux-2.6.22.10/.config'
> 
> I'm facing the same problem with buildroot-20071015.tar.bz2 snapshot. I 
> do think it is a genuine bug because after running 'make menuconfig' in 
> the kernel directory manually, I still get the same error message.
> 
> j
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
