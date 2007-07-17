From: Hebbar <gururajakr@sanyo.co.in>
Date: Tue, 17 Jul 2007 04:37:53 -0700 (PDT)
Subject: [Buildroot] Fontconfig/freetype build searches for lmxl2 in system
 /usr/lib b4 searching in staging_dir/usr/lib
Message-ID: <11647587.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Dear all,

   while building fontconfig/freetype, i found that -lxml2 is taken from
system /usr/lib whereas it is suppose to take from staging_dir/usr/lib. when
it is checking for -lxml2 it 1st searched from system /usr/lib & gave error
as invalid file format. i renamed the one in system /usr/lib to
old_libxml2.so & then "make fontconfig"  went on taking -lxml2 from
staging_dir/usr/lib. so i doubt many files like this are taken from system
/usr/lib than from staging_dir/usr/lib. kindly let me know if i need any
changes/updates. 

sorry for double post. just wanted to split and make subject more clear. 

Regards 
Gururaja 

-- 
View this message in context: http://www.nabble.com/Fontconfig-freetype-build-searches-for-lmxl2-in-system--usr-lib-b4-searching-in-staging_dir-usr-lib-tf4096288.html#a11647587
Sent from the BuildRoot mailing list archive at Nabble.com.
