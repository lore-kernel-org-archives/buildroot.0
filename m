From: Steve Spano <steve@fl-eng.com>
Date: Tue, 26 Aug 2008 21:05:02 -0400
Subject: [Buildroot] ### Executing FIles
In-Reply-To: <19172648.post@talk.nabble.com>
Message-ID: <00c201c907e0$efb33e20$1a01a8c0@flexeon32>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

Thanks for the fast replies from the list.

I ws thinking about dependencies, and will check that out tomorrow.
There may be a library or module issue going on.

I will rebuild with ldd so I can check it out.

The target is the MX31 and I am trying to get the OpenGL libraries up and
running on it.

Thanks

Steve Spano, President
Finger Lakes Engineering


-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org] On
Behalf Of Hebbar
Sent: Tuesday, August 26, 2008 8:11 PM
To: buildroot at uclibc.org
Subject: Re: [Buildroot] ### Executing FIles


Hi,

>>I change its permissions to execute and I type "./myfile"
>>It comes back saying "-sh: myfile not found"

This could happen  if,
1. the necessary libs are no present in the search path. like /lib /usr/lib.
Use ldd to check the dependencies
2, if its not an executable. use file command to check the file type

Buildroot toolchain provides both the commands. u need to enable them to be
built for target platform.

Hope this is usefull

Regards
Gururaja


-- 
View this message in context:
http://www.nabble.com/svn-commit%3A-trunk-buildroot-package-atk-tp19171723p1
9172648.html
Sent from the BuildRoot mailing list archive at Nabble.com.

_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot


-- 
Internal Virus Database is out-of-date.
Checked by AVG. 
Version: 7.5.524 / Virus Database: 270.6.0/1602 - Release Date: 8/9/2008
1:22 PM
