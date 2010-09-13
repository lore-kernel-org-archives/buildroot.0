From: S W <sw18@hotmail.co.jp>
Date: Tue, 14 Sep 2010 02:51:42 +0900
Subject: [Buildroot] Build error: No rule to make target `ubootboard_config'
In-Reply-To: <KAW101-W3400321E421A55939E3C979B750@phx.gbl>
References: <KAW101-W9A50593711791769ABB3C9B740@phx.gbl>, ,
	<20100911105201.176d1396@surf>,
	<KAW101-W3400321E421A55939E3C979B750@phx.gbl>
Message-ID: <KAW101-W663381351DE5AA588F11B19B770@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi 

I am trying to build a Uboot loader for ARM.
If I leave the "U-boot board name" as blank,
there is an error as "NO U-Boot board name set. 
Check your BR2_TARGET_UBOOT_BOARDNAME setting."

But if I input the U-Boot board name as a name like "ubootboard",
I encountered another error "No rule to make target `ubootboard_config".

I attached the error message with this email.

How I create the build rule for U-Boot board?

Thanks 
Terry
 		 	   		  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100914/a5b3ad04/attachment-0001.html>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: errmsg.txt
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100914/a5b3ad04/attachment-0001.txt>
