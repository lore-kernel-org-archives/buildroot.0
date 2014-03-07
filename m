From: Frank Ihle <frank.ihle@hs-offenburg.de>
Date: Fri, 07 Mar 2014 14:08:08 +0100
Subject: [Buildroot] Are deferred Initcalls possible with a Linux 2.6.39
	Kernel?
Message-ID: <5319D2C8020000460004B7A4@gwia2.rz.hs-offenburg.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I want to load several modules not at boot time, but afterwards when system is ready to operate. There are the deferred initcalls, that do exactly what I want as  explained on http://elinux.org/Deferred_Initcalls. 

Now to use them I need to apply a patch. On the given page, there are patches for Linux 2.6.26, 2.6.27, 2.6.28 and 3.10, unfortunately I'm using a Linux 2.6.39 and non of those patches can be applied successfully (Patch fails and If I make an Image afterwards, the "/proc/deferred_initcall" is not included)

Does anyone know if there are further patches or is there a workaround for Linux 2.6.39?

Kind Regards

Frank

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140307/b8af308e/attachment.html>
