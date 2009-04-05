From: Bai Shuwei <baishuwei@gmail.com>
Date: Sun, 5 Apr 2009 21:13:06 +0800
Subject: [Buildroot] cp: missing destination file operand after
	`/uclibc/linux-2.6.29/.config'
Message-ID: <f3566d60904050613p223161dav5da090976914e1ee@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

all:
  hi, when i build my project by buildrootm, an error message is showed.

 rm -rf
/home/projects/crosscompile/buildroot/project_build_i386/uclibc/buildroot-config
mkdir -p /home/projects/crosscompile/buildroot/project_build_i386/uclibc
cp -dpRf package/config/buildroot-config
/home/projects/crosscompile/buildroot/project_build_i386/uclibc/buildroot-config
cp -dpf
/home/projects/crosscompile/buildroot/project_build_i386/uclibc/linux-2.6.29/.config
cp: missing destination file operand after
`/home/projects/crosscompile/buildroot/project_build_i386/uclibc/linux-2.6.29/.config'
Try `cp --help' for more information.
make: ***
[/home/projects/crosscompile/buildroot/project_build_i386/uclibc/linux-2.6.29/.configured]
Error 1

I have copied my configure file of linux kernel to the
/home/projects/crosscompile/buildroot/project_build_i386/uclibc/linux-2.6.29/.config.
But the messaged is showed too.

Hope your help soon!

Best Regards!

-- 
Love other people, as same as love yourself!
Don't think all the time, do it by your hands!

Personal URL: http://dslab.lzu.edu.cn:8080/members/baishw/
E-Mail: baishuwei at gmail.com or baishuwei at dslab.lzu.edu.cn
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090405/989cf0c4/attachment.htm>
