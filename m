From: Jaap Crezee <jaap@jcz.nl>
Date: Sat, 25 Jul 2015 18:21:40 +0200
Subject: [Buildroot] qt5base build issue
In-Reply-To: <55B210AF.8010004@ecagroup.com>
References: <CAGm1_kumsLYH8RmBn3WWr64_yN1mjhc5DGhiZfpqCSdc3jvPtQ@mail.gmail.com>
 <55B0FEED.4070700@ecagroup.com>
 <CAGm1_kv_JrjpKVJ50_APpNsfP1knqxkNcr8bN0bSacvxVsjq7A@mail.gmail.com>
 <CAGm1_ku+MGyBs_CkXtAjZVgqCkmNAPJ8mjW6yc05unKzyQRDhA@mail.gmail.com>
 <55B1FA0C.6000809@ecagroup.com>
 <CAGm1_kujy48mMmd4QMSJL+zbEXf3ooRWN8mKd+WF6e5Dg3LeQA@mail.gmail.com>
 <55B210AF.8010004@ecagroup.com>
Message-ID: <55B3B794.3080706@jcz.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/24/15 12:17, Julien CORJON wrote:
>>>>>>> During compilation I get following error:
>>>>>>>
>>>>>>> Running configuration tests...
>>>>>>> Failed to process makespec for platform 'devices/linux-buildroot-g++'
>>>>>>> Project ERROR: Compiler
>>>>>>> /home/user/MyProjects/oss/buildroot/prods1/host/usr/bin/ccache
>>>>>>> /home/user/MyProjects/oss/buildroot/prods1/host/usr/bin/arm-none-linux-gnueabi-g++
>>>>>>> not found. Check the value of CROSS_COMPILE -device-option
>>>>>>> Could not read qmake configuration file
>>>>>>> /home/user/MyProjects/oss/buildroot/prods1/build/qt5base-5.5.0/mkspecs/devices/linux-buildroot-g++/qmake.conf.

<snip>

Dear all,

Please see attached patch. It fixes this build issue for me.

Kind regards,


Jaap Crezee
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Added-extra-patch-to-qt5base-package-for-fixing-ccac.patch
Type: text/x-patch
Size: 1384 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150725/1c1a8603/attachment.bin>
