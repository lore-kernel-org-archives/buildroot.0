From: =?big5?B?V2VpY2hlbiBMZWUgKKf1q8K+XyAtIEFza2V5IC0gVFcp?= <weichen.lee@askey.com.tw>
Date: Thu, 5 Jul 2007 17:45:34 +0800
Subject: [Buildroot] Some problem of copying libs using external toolchain
Message-ID: <9C1F4801E7902C4DB99BD17E121A00925F776ACE@tpex07.askey.com.tw>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
When I use external toolchain option in buildroot,
I set the parameter "BR2_TOOLCHAIN_EXTERNAL_LIBS" with the library copied from
external toolchain.
There is a copied script function in makefile "toolchain/external-toolchain/ext-tools.mk" which is done this job.
But it doesn't copy any file. The find command in the script is not workable because it doesn't find the library file(My OS is RedHat 9)
I extract the script from the makefile as another file and call the script file in the makefile.
It does copied the library file from external toolchain.
But I don't know what difference between these two situation.

Best Regards
====================================
??????????

???? ?????

??? (Weichen Lee)

TEL:03-4759460  EXT:872
FAX:03-4759414
E-mail:weichen.lee at askey.com.tw
====================================
-------------- next part --------------
A non-text attachment was scrubbed...
Name: copy_toolchain_lib_root
Type: application/octet-stream
Size: 1078 bytes
Desc: copy_toolchain_lib_root
Url : http://busybox.net/lists/buildroot/attachments/20070705/91e1b9fb/attachment-0002.obj 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: ext-tool.mk
Type: application/octet-stream
Size: 632 bytes
Desc: ext-tool.mk
Url : http://busybox.net/lists/buildroot/attachments/20070705/91e1b9fb/attachment-0003.obj 
