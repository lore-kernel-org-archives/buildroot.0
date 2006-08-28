From: Thomas Moschny <thomas.moschny@gmx.de>
Date: Tue, 29 Aug 2006 00:41:26 +0200
Subject: [Buildroot] Exception support
Message-ID: <200608290041.27413.thomas.moschny@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

is there a way to get a toolchain built for i686, that supports C++ 
exceptions?

In a buildroot naively build using gcc 4.1.0 or 4.1.1 and uclibc 0.9.28, C++ 
exceptions don't work. Apps instead abort with "terminate called after 
throwing an instance of foo" when an exception of type foo is thrown.

I found this thread: 
http://www.nabble.com/gcc-4.1.1-and-exception-handling-(libstdc++)-t2084671.html
but the quintessence remains unclear to me.

Thanks,
Thomas
