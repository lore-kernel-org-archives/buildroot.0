From: Nathanael D. Noblet <nathanael@gnat.ca>
Date: Tue, 22 Jul 2008 21:13:56 -0600
Subject: [Buildroot] Openssl won't compile
Message-ID: <4886A1F4.1010900@gnat.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
   Anyone experience difficulty compiling openssl (0.9.7m)? I get a 
missing sys/timeb.h, upgrading to ssl 0.9.8g) is no better as the 
patches don't apply and I'm not sure what the ones I couldn't fix were 
doing.

   For what it is worth, I'm using gcc-3.1 and a daily snapshot of uclibc.


-- 
Nathanael d. Noblet
Gnat Solutions, Inc
T: 403.875.4613
