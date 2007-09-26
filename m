From: Sushi Sensei <sinestado@gmail.com>
Date: Wed, 26 Sep 2007 13:39:24 -0300
Subject: [Buildroot] ERROR in build 20040: uClibc-0.9.29 don't download
Message-ID: <a63ecaf0709260939h1cd6158v19324ef2a1206920@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There are a space in DL_DIR...I guess

rm -rf /tmp/BUILDROOT/buildroot/project_build_i586/uclibc/buildroot-config
mkdir -p /tmp/BUILDROOT/buildroot/project_build_i586/uclibc
cp -dpRf package/config/buildroot-config
/tmp/BUILDROOT/buildroot/project_build_i586/uclibc/buildroot-config
wget --passive-ftp  -P /tmp/BUILDROOT/buildroot/dl /uClibc-0.9.29.tar.bz2
/uClibc-0.9.29.tar.bz2: Unsupported scheme.
make: *** [/tmp/BUILDROOT/buildroot/dl/uClibc-0.9.29.tar.bz2] Error 1


-- 
------------------------------------------------------
--- Timeo Danaos et dona ferentes ---
------------------------------------------------------
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070926/2bc271fb/attachment.htm 
