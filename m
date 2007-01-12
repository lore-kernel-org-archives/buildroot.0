From: nina.holly at aerende.com <nina.holly@aerende.com>
Date: Thu, 11 Jan 2007 21:12:37 -0800 (PST)
Subject: [Buildroot] Qtopia Phone 4.1.4 compile error
Message-ID: <4507.63.193.249.101.1168578757.squirrel@webmail.aerende.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

1.  I had noticed some checkins wrt getting Qtopia 4 compiling
    with buildroot.  Does anyone know if Qtopia 4 compiles
    with buildroot and uClibc?

    I am trying to compile Qtopia 4 with
the latest version of buildroot/uClibc, version 17224.
I get the following error in one of the files:

error: `index' declared as a `virtual' field

2.  Previously I was told that enabling SuSV3 would fix this
    which it did.  But with the latest version of buildroot
    SUSV3 is broken out into macros and functions.  I have
    the SuSV3 marcos enabled.  Do I need the SuSV3 functions
    enabled as well?

3.  Is there anything else I need to enable to be able to
    compile Qtopia 4?



Enclosed are:

a.  uclibc.config
b.  buildroot.config


Thanks in advance,

Nina

-------------- next part --------------
A non-text attachment was scrubbed...
Name: uclibc.config
Type: application/octet-stream
Size: 4837 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070111/73e0e590/attachment.obj 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot_config
Type: application/octet-stream
Size: 10422 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070111/73e0e590/attachment-0001.obj 
