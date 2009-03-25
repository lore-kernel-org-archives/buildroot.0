From: Bai Shuwei <baishuwei@gmail.com>
Date: Wed, 25 Mar 2009 10:19:08 +0800
Subject: [Buildroot] compile the buildroot
Message-ID: <f3566d60903241919y397834derc61bca2835e5a192@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

all, hi:
  when i compile the buildroot, I got the bellow error message:

rm -rf
/home/baishw/projects/cross-compile/buildroot/project_build_i386/via/buildroot-config
mkdir -p
/home/baishw/projects/cross-compile/buildroot/project_build_i386/via
cp -dpRf package/config/buildroot-config
/home/baishw/projects/cross-compile/buildroot/project_build_i386/via/buildroot-config

cp -dpf
/home/baishw/projects/cross-compile/buildroot/project_build_i386/via/linux-2.6.28.7/.config
cp: missing destination file operand after
?/home/baishw/projects/cross-compile/buildroot/project_build_i386/via/linux-2.6.28.7/.config?


I think a parameter is lost for cp, but I know how to fix it. I am glad if
you can give some idea! thanks all!

Best Regards!

Bai Shuwei

-- 
Love other people, as same as love yourself!
Don't think all the time, do it by your hands!

Personal URL: http://dslab.lzu.edu.cn:8080/members/baishw/
E-Mail: baishuwei at gmail.com or baishuwei at dslab.lzu.edu.cn
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090325/729dfed4/attachment.htm>
