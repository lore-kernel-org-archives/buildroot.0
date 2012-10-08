From: Zoran Djordjevic <djdjdjole@yahoo.com>
Date: Mon, 8 Oct 2012 09:29:47 -0700 (PDT)
Subject: [Buildroot] u-boot compiling
Message-ID: <1349713787.63802.YahooMailNeo@web164603.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I want to achieve booting linux on my ARM board without messages
displaying on console. AFAIK, I must have u-boot version compiled
with that possiblity (CONFIG_SILENT_CONSOLE). My u-boot binary 
version (on my board CD) seems not to be of that?kind, because when I 
set?"silent" environment variable, nothing happens. 
So,?I am interested if I can compile u-boot alone, by?
using Buildroot ie.?without building kernel and root file system ?
Also,?what amount of boot?time shortage?can I expect when supressing
console messages ?
?
Regards
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121008/3a46a577/attachment.html>
