From: nina.holly at aerende.com <nina.holly@aerende.com>
Date: Fri, 6 Apr 2007 09:14:33 -0700 (PDT)
Subject: [Buildroot] frame buffer problems
Message-ID: <2034.63.193.249.101.1175876073.squirrel@webmail.aerende.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
    I am using Linux 2.6.10 with devfs on ARM.  I know that
devfs is deprecated/obsolete.  The framebuffer works fine
with buildroot svn version 15763.  But when I switched to
buildroot version 17224 I get a return value < 0 when I try to execute

ioctl(frame_buffer_ptr, FBIOGET_VSCREENINFO, &var_info);

I.E. I can't read the basic frame buffer information.

1.  Is this a problem in the version of buildroot that I am using?

2.  Is this because buildroot version 17224 doesn't work
    with devfs and I need to switch to using udev?

3.  Do I need to use Linux version greater than 2.6.15 (which works
    with udev) to work with buildroot version 17224?

Thanks in advance for any pointers.

Nina
