From: Jonathan Dumaresq <jdumaresq@cimeq.qc.ca>
Date: Tue, 15 Jan 2008 11:39:14 -0500
Subject: [Buildroot] What to to with this error ?
Message-ID: <000001c85795$2a272050$6e00a8c0@JONATHAN>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

 

I got this error now

 

rm -rf
/buildroot/buildroot/project_build_arm_wchar/at91rm9200df/buildroot-config

mkdir -p /buildroot/buildroot/project_build_arm_wchar/at91rm9200df

cp -dpRf package/config/buildroot-config
/buildroot/buildroot/project_build_arm_wchar/at91rm9200df/buildroot-config

rm -rf
/buildroot/buildroot/project_build_arm_wchar/at91rm9200df/root/usr/share/inf
o

rm -rf
/buildroot/buildroot/project_build_arm_wchar/at91rm9200df/root/usr/share/man

rm -rf
/buildroot/buildroot/project_build_arm_wchar/at91rm9200df/root/share/locale

rm -rf
/buildroot/buildroot/project_build_arm_wchar/at91rm9200df/root/usr/share/doc

/usr/bin/make MAKE="/usr/bin/make -j1"
CC=/buildroot/buildroot/build_arm_wchar/staging_dir/usr/bin/arm-linux-uclibc
-gcc os="linux"
LD="/buildroot/buildroot/build_arm_wchar/staging_dir/usr/bin/arm-linux-uclib
c-gcc -shared" LOCALBASE="/usr" -C
/buildroot/buildroot/build_arm_wchar/mDNSResponder-107.6/mDNSPosix

make[1]: Entering directory
`/buildroot/buildroot/build_arm_wchar/mDNSResponder-107.6/mDNSPosix'

Responder daemon done

Client library done

make[2]: Entering directory
`/buildroot/buildroot/build_arm_wchar/mDNSResponder-107.6/Clients'

cc dns-sd.c -L../mDNSPosix/build/prod/ -ldns_sd -I../mDNSShared -o
build/dns-sd

/usr/bin/ld: skipping incompatible ../mDNSPosix/build/prod//libdns_sd.so
when searching for -ldns_sd

/usr/bin/ld: cannot find -ldns_sd

collect2: ld returned 1 exit status

make[2]: *** [build/dns-sd] Error 1

make[2]: Leaving directory
`/buildroot/buildroot/build_arm_wchar/mDNSResponder-107.6/Clients'

make[1]: *** [../Clients/build/dns-sd] Error 2

make[1]: Leaving directory
`/buildroot/buildroot/build_arm_wchar/mDNSResponder-107.6/mDNSPosix'

make: *** [/buildroot/buildroot/build_arm_wchar/mDNSResponder-107.6/.built]
Error 2

 

regards

 

Jonathan

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080115/35cb1bae/attachment.htm 
