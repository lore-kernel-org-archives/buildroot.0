From: Zoran Djordjevic <djdjdjole@yahoo.com>
Date: Tue, 11 Sep 2012 05:29:52 -0700 (PDT)
Subject: [Buildroot] big root fs
Message-ID: <1347366592.32116.YahooMailNeo@web164601.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello
?
I built linux kernel using Buildroot, but included glibc support instead of
uClibc. For that matter I was using Crosstool NG. 
I achieved the goal - compiled the GTK?applications and they work on
my target ARM board. All of that is?by using?NFS on my Ubuntu machine.
However the size of generated jffs2 is 52MB- which is huge for me.
Although I included GTK examples, and maybe few more properties I still
wander if the size is related (only)?to glibc matter. 
I will try building with uClibc (only to detect difference in size), but at the 
moment it is important to me to use glibc, so what else can contribute to 
overal size of image, other than??(maybe) glibc. 
I attatched my .config if someone want to look at it and maybe find some 
memory eating matter. Also,?can size of glibc be reduced, by throwing
out some properties.
?
Regards
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120911/a73951a3/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/xml
Size: 29821 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120911/a73951a3/attachment-0001.wsdl>
