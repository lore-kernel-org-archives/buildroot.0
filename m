From: Hebbar <gururajakr@sanyo.co.in>
Date: Tue, 21 Aug 2007 17:14:31 -0700 (PDT)
Subject: [Buildroot] unable to make libglib12. error about missing
	libglib12.so
Message-ID: <12265775.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi all,

 I am trying to make libglib12 and it ends with error about missing
libglib.so in buildroot/build_arm/staging_dir/lib/. When i searched in this
firectory i had 
root at box124:~/project/original/bldrt/buildroot# ls -la
build_arm/staging_dir/lib/libglib.*
-rw-r--r-- 1 root root 596464 Aug 22 11:58
build_arm/staging_dir/lib/libglib.a
-rwxr-xr-x 1 root root    593 Aug 22 11:58
build_arm/staging_dir/lib/libglib.la

Kindly help me to resolve the same. I tried editing libglib12.mk file but
failed. 

Regards
Gururaja


Make libglib12 error-->  


cp -dpf
/home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/lib/libglib.so
/home/guru/project/original/bldrt/buildroot/project_build_arm/uclibc/root/lib/
cp: cannot stat
`/home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/lib/libglib.so':
No such file or directory
make: ***
[/home/guru/project/original/bldrt/buildroot/project_build_arm/uclibc/root/lib/libglib-1.2.so.0.0.10]
Error 1

-- 
View this message in context: http://www.nabble.com/unable-to-make-libglib12.-error-about-missing-libglib12.so-tf4308633.html#a12265775
Sent from the BuildRoot mailing list archive at Nabble.com.
