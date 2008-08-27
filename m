From: Hebbar <gururajakr@sanyo.co.in>
Date: Tue, 26 Aug 2008 17:11:09 -0700 (PDT)
Subject: [Buildroot] ### Executing FIles
In-Reply-To: <00b101c907cd$12fa1840$1a01a8c0@flexeon32>
References: <20080826223720.B77253C6C1@busybox.net>
	<00b101c907cd$12fa1840$1a01a8c0@flexeon32>
Message-ID: <19172648.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


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
View this message in context: http://www.nabble.com/svn-commit%3A-trunk-buildroot-package-atk-tp19171723p19172648.html
Sent from the BuildRoot mailing list archive at Nabble.com.
