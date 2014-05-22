From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Thu, 22 May 2014 21:01:47 +0200
Subject: [Buildroot] How to use the TZ selection ?
Message-ID: <F979DDABBA2E48ADB211714423219F77@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi

How is the TZ menu option intended to be used ?
In my older builds I had a file /etc/TZ, but using the TZ menu
options creates a symlink to a directory so /etc/TZ is a directory
Containing al timezone definitions.
This does not seem to work since uClibc expects a file /etc/TZ
Am I missing something ?
 

Sagaert Johan
