From: Jean-Claude Gervais <jc.gervais@videotron.ca>
Date: Wed, 14 Nov 2007 13:33:49 -0500
Subject: [Buildroot] I think I'm in love! And other newbie-type questions...
Message-ID: <1195065229.17103.13.camel@mercury.sprymusic>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

	I do CM (configuration management) for an embedded software development
company. That means I have to create tools and procedures to make it
possible to re-produce software we have already shipped or will be
shipping.

	Reading Buildroot's documentation, I am amazed at the ingenuity of the
solution and really pleased that it may permit me to accomplish the
goals I mentioned. Thank you for creating such a useful project.

I do have a question:

After running the 'make menuconfig' and selecting a number of options, I
ran 'make' which proceeded to crank away for a number of hours.

At the end though it did not complete because of what appears to be a
missing file - the kernel .config file. More specifically

cp: missing destination file operand after
`/home/jgervais/Desktop/sandboxes/buildroot/project_build_arm/uclibc/linux-2.6.22.10/.config'

This sort of makes sense to me because although I did specify some
kernel options, I don't remember actually running the projected kernel's
'make menuconfig' which would have permitted me to essentially set all
the kernel options.

I read more of the documentation but could not find how this should be
handled although it may be quite evident when you are more experienced.

So my question is - What do I need to do to configure the kernel?

I believe once that is done, I will only need to type make and let the
buildroot procedure continue where it left off.

If there is a document that explains all this, can you please point me
towards it?

Thank you
J

PS - I'll make an effort to not be so long-winded next time.
