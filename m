From: Bernhard Roth <broth@roth-itk.de>
Date: Mon, 08 Aug 2011 15:19:16 +0200
Subject: [Buildroot] Adding libev to buildroot
In-Reply-To: <CAGm1_ktqDGmoRtbWuN8uDM3qiL00K+kS-VbyVcDV3p9sqav9Jg@mail.gmail.com>
References: <4E3E72BF.9040302@roth-itk.de>
 <CAGm1_ktR=-TywrmxLORcmG3Hch1=RsqDusL9y+UmJKt6=gT30A@mail.gmail.com>
 <4E3F79CF.40608@roth-itk.de>
 <CAGm1_ktqDGmoRtbWuN8uDM3qiL00K+kS-VbyVcDV3p9sqav9Jg@mail.gmail.com>
Message-ID: <4E3FE254.7030004@roth-itk.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yegor,

I did a patch according to Linus' description.
I hope this works and describes clearly the changes I did.

Just today I was recompiling a new root filesystem and libev works just 
like a charm!
Keep your good work going, thank you!

Best regards,

Bernhard


On 08/08/2011 08:34 AM, Yegor Yefremov wrote:
> Hello Bernhard,
>
> you have following ways to get to the patch:
>
> 1. see kernel documentation on how to compare two src dirs:
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob_plain;f=Documentation/SubmittingPatches;hb=HEAD
> 2. using quilt: http://en.wikipedia.org/wiki/Quilt_%28software%29. It
> requires one clean src dir, your two files you sent to the list and
> changes to package/Config.in
> 3. git: clone buildroot repository, make your changes, git add, git
> commit, http://www.kernel.org/pub/software/scm/git/docs/git-format-patch.html.
> See http://progit.org/book/ for syntax and details
>
> Yegor

-------------- next part --------------
A non-text attachment was scrubbed...
Name: libev.patch
Type: text/x-patch
Size: 3325 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110808/40cdafee/attachment.bin>
