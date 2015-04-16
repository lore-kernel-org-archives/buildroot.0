From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Thu, 16 Apr 2015 08:33:19 -0400
Subject: [Buildroot] Intel Edison support
Message-ID: <CA+-urNRPe3bv+FH9He==b2_aa_NCnDXwxUJGGZqfUsNGyZt74w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I have support for the Intel Edison working in Buildroot. It took a while
to figure out everything that Intel's Yocto distribution was doing, but
after you simplify it down, it doesn't seem so bad. I'd send the patch up
for review, but it is dwarfed by two massive patch files on u-boot and the
kernel that I had to copy from Intel's Yocto distro [1]. It seems better if
BR could download the Yocto distro, extract the patch files, and use them
when needed. It also doesn't seem right for BR to have to carry around a
couple mega-patches. Is this possible and is there an example somewhere?

If you would like to see my current patches for Edison support, they are
available here: https://github.com/fhunleth/buildroot-edison.

Thanks,
Frank

[1] http://www.intel.com/support/edison/sb/CS-035180.htm
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150416/7fe67c47/attachment.html>
