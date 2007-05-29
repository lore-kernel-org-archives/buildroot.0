From: Stuart Wood <stuart.wood@labxtechnologies.com>
Date: Tue, 29 May 2007 10:36:12 -0400
Subject: [Buildroot] bug for libid3tag Config.in
In-Reply-To: <4651B83D.1010905@apexar.com>
Message-ID: <002301c7a1fe$b4645d70$016efea9@SDW>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I believe that the libid3tag Config.in needs

    select BR2_PACKAGE_ZLIB 

Added to it. Otherwise you get an error that zlib
Is missing when compiling libid3tag.
My system is ARM920T, OABI, uClibc 0.9.29,
Binutils 2.16.1, gcc 3.4.6.

Stuart
