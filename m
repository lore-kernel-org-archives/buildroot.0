From: oreddy <oreddy@rfnetech.com>
Date: Thu, 26 Apr 2012 18:12:36 +0800
Subject: [Buildroot] error toolchain build for mips-linux-uclibc with
	BR2_INSTALL_LIBSTDCPP
In-Reply-To: <CAAawjsQQ0nc9HYYAegCTs6sRM+rwXhimyV83hB+jwR6bo1B=SA@mail.gmail.com>
References: <CAAawjsQQ0nc9HYYAegCTs6sRM+rwXhimyV83hB+jwR6bo1B=SA@mail.gmail.com>
Message-ID: <4F991F94.50608@rfnetech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Forwarded conversation
Subject: *error toolchain build for mips-linux-uclibc with 
BR2_INSTALL_LIBSTDCPP*
------------------------

From: *chinna obireddy* <chinnaobi at gmail.com <mailto:chinnaobi@gmail.com>>
Date: Thu, Apr 26, 2012 at 4:58 PM
To: buildroot at busybox.net <mailto:buildroot@busybox.net>


Hi,

I have already built the tool chain for mips with gcc 4.3.3 and have 
been using from some time. Now we got a request to build an application 
which needs g++ compiler for same build.

I have enabled BR2_INSTALL_LIBSTDCPP option in .config file and tried to 
build the toolchain I have received the following error:

*cp: cannot stat 
`/Reddy/11n_Build/Test/dev_main/build/gcc-4.3.3/build_mips/staging_dir/usr/mips-linux-uclibc/lib*/libstdc++.so*': 
No such file or directory*
*
*
I have seen posts on this issue online but couldn't find any solution.
*
*
Thank you in advance,
Reddy.

----------
From: *Thomas Petazzoni* <thomas.petazzoni at free-electrons.com 
<mailto:thomas.petazzoni@free-electrons.com>>
Date: Thu, Apr 26, 2012 at 5:01 PM
To: chinna obireddy <chinnaobi at gmail.com <mailto:chinnaobi@gmail.com>>
Cc: buildroot at busybox.net <mailto:buildroot@busybox.net>


Le Thu, 26 Apr 2012 16:58:09 +0800,
chinna obireddy <chinnaobi at gmail.com <mailto:chinnaobi@gmail.com>> a ?crit :

 > *cp: cannot stat
 > 
`/Reddy/11n_Build/Test/dev_main/build/gcc-4.3.3/build_mips/staging_dir/usr/mips-linux-uclibc/lib*/libstdc++.so*':
 > No such file or directory*

I am not sure what you are using, but looking at this path, it seems
like it is definitely not a recent Buildroot version.

Could you please specify which Buildroot version you're using, and
your .config file? Note that if you're using an ancient Buildroot
version, it's unlikely that we will do anything besides suggesting you
to upgrade to a modern version.

Best regards,

Thomas
--
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

----------
From: *chinna obireddy* <chinnaobi at gmail.com <mailto:chinnaobi@gmail.com>>
Date: Thu, Apr 26, 2012 at 5:30 PM
To: Thomas Petazzoni <thomas.petazzoni at free-electrons.com 
<mailto:thomas.petazzoni@free-electrons.com>>


Build root version 2009.08 and i have attached the config file.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120426/ea4e1a32/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: db12x.config
Type: application/octet-stream
Size: 18858 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120426/ea4e1a32/attachment-0001.obj>
