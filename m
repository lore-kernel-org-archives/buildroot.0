From: RainerB <berns@BEKA-Elektronik.de>
Date: Tue, 22 Apr 2008 00:59:05 -0700 (PDT)
Subject: [Buildroot]  Buildroot fails with GTK+
Message-ID: <16823504.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

when i use buildroot (/trunk from 18.04.2008) for at91sam9261ek it creates
the root file system and the toolchain. 
If i select gtk+ it fails during atk 1.9.1 Building with the following
message:

grep:
/usr/local/development/buildroot/build_arm/staging_dir/usr/local/development/buildroot/build_arm/libglib2-2.15.4/glib/libglib-2.0.la:
No such file or directory

The file libglib-2.0.1a exist in
...../buildroot/build_arm/libglib2-2.15.4/glib/ but not in the above
nonsense directory.

The log file is attached.

Thanks for any help.

Regards

Rainer

http://www.nabble.com/file/p16823504/test.log test.log 
-- 
View this message in context: http://www.nabble.com/Buildroot-fails-with-GTK%2B-tp16823504p16823504.html
Sent from the BuildRoot mailing list archive at Nabble.com.
