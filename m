From: Ian Preston <ianopolous@gmail.com>
Date: Fri, 7 Nov 2008 12:26:36 +0000
Subject: [Buildroot] diffutils fails to build
Message-ID: <d9bef6aa0811070426o55805eb1q6d95ddb0476f074b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I'm trying to use buildroot to build a minimal, non graphical linux which
has gcc and gfortran. I got a good way through the build process, and then
it crashes during the build of diffutils:

make[1]: Entering directory
`/home/ian/jpc/buildroot/build_i386/diffutils-2.8.1'
/usr/bin/make  INSTALL_PROGRAM="/bin/bash
/home/ian/jpc/buildroot/build_i386/diffutils-2.8.1/config/install-sh -c -s"
\
      INSTALL_STRIP_FLAG=-s \
      `test -z 'true -Not_stripping' || \
        echo "INSTALL_PROGRAM_ENV=STRIPPROG='true -Not_stripping'"` install
/usr/bin/make: invalid option -- N

I've attached my config file.
If anyone has any ideas about how to fix this, or to remove diffutils from
the process, then I will be very very grateful. Thanks guys!

Ian

-- 
Senior Software Engineer
IGD group
Oxford University
http://www-jpc.physics.ox.ac.uk/
http://www-nereus.physics.ox.ac.uk/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081107/9d186312/attachment-0001.htm 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 18941 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20081107/9d186312/attachment-0001.obj 
