From: Hebbar <gururajakr@sanyo.co.in>
Date: Mon, 6 Aug 2007 21:38:37 -0700 (PDT)
Subject: [Buildroot] [patch] libxml2 fixes
In-Reply-To: <46B739FF.5020507@mainstreetsoftworks.com>
References: <46B739FF.5020507@mainstreetsoftworks.com>
Message-ID: <12028348.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Brad,

     After i applied ur patch, i am getting an error when compilling libxml2
as missing xml-config file

<snip>
<snip>

rm -f
/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/lib/libxml2.la
/home/guru/project/original/toolchains/buildroot/toolchain_build_arm/bin/sed
-i -e
's:prefix=/usr:prefix=/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr:'
\
        -e
's:includedir=/usr/include:includedir=/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/include:'
\
       
/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/bin/xml2-config
/home/guru/project/original/toolchains/buildroot/toolchain_build_arm/bin/sed:
can't read
/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/bin/xml2-config:
No such file or directory
make: ***
[/home/guru/project/original/toolchains/buildroot/build_arm/libxml2-2.6.29/libxml2.la]
Error 



   But i see that xml-config is in my buildroot/build_arm/libxml2-2.6.29
directory. i think its not copied to build_arm/staging_dir/usr/bin/. kindly
let me know if i can manually copy the same or i should add/make  any
changes.

Regards
Gururaja
-- 
View this message in context: http://www.nabble.com/-patch--libxml2-fixes-tf4224762.html#a12028348
Sent from the BuildRoot mailing list archive at Nabble.com.
