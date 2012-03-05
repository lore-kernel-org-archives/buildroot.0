From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 5 Mar 2012 18:01:16 +0100
Subject: [Buildroot] udev build error solved : core dependency tar must be >
	1.20
Message-ID: <3727543134DD41C589596DA3C5EC9F5B@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
It seems the tar -J option was introduced with tar version 1.21 
I upgraded my host to the latest tar version (1.26) and now it udev 181 builds.
Maybe this is something to check for in  the core dependencies check.
My debian lenny had version 1.20 in its package list.
 
Sagaert Johan
