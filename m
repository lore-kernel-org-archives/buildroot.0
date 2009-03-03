From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue, 3 Mar 2009 16:51:51 +0100
Subject: [Buildroot] Kernel Configuration 2.6.28.7
In-Reply-To: <22310694.post@talk.nabble.com>
References: <22310694.post@talk.nabble.com>
Message-ID: <20090303155151.GA31119@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 03, 2009 at 07:22:46AM -0800, RainerB wrote:
>
>Hi,
>
>i use the latest svn revision with the at91sam9263ek_defconfig. Creating
>,modifying and mounting of a jffs2 filesystem works without problems.
>Using the kernel on my hardware cause a fault. Therefore i want' to
>configurate the kernel to switch off some unneeded features and check the
>configuration. 
>I have read the documentation but found no hint how to do this. 

In docs/README please reread the paragraph that is titled
More finegrained configuration:
===============================

>Thanks for any help.

HTH,
