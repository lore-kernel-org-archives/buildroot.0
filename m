From: Ulf Samuelsson <ulf@atmel.com>
Date: Sat, 12 Jan 2008 18:10:23 +0100
Subject: [Buildroot] error messages
References: <00b501c853c9$4fc21330$6e00a8c0@JONATHAN>
Message-ID: <00a601c85644$796a65c0$020514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi all,
> 
> 
> 
> I just use the defconfig of the rm9200 to setup a build process. 
> I go the error that you can find in the attached file. 
> Regards
> 
> Jonathan

Apply diffs when bzero is found.

-    bzero(msg, *len);
+    memset(msg, '\0', *len);Best Regards
Ulf Samuelsson
