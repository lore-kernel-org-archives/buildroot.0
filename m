From: Luis R. Rodriguez <mcgrof@gmail.com>
Date: Fri, 6 Apr 2007 13:05:45 -0400
Subject: [Buildroot] frame buffer problems
In-Reply-To: <2034.63.193.249.101.1175876073.squirrel@webmail.aerende.com>
References: <2034.63.193.249.101.1175876073.squirrel@webmail.aerende.com>
Message-ID: <43e72e890704061005g7acb436es181f5d9e2c788427@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 4/6/07, nina.holly at aerende.com <nina.holly@aerende.com> wrote:
> Hi,
>     I am using Linux 2.6.10 with devfs on ARM.  I know that
> devfs is deprecated/obsolete.  The framebuffer works fine
> with buildroot svn version 15763.  But when I switched to
> buildroot version 17224 I get a return value < 0 when I try to execute
>
> ioctl(frame_buffer_ptr, FBIOGET_VSCREENINFO, &var_info);

Was the return value -14 or -19?

  Luis
