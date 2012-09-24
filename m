From: Zoran Djordjevic <djdjdjole@yahoo.com>
Date: Mon, 24 Sep 2012 13:11:26 -0700 (PDT)
Subject: [Buildroot] Kernel version
Message-ID: <1348517486.7248.YahooMailNeo@web164604.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A problem with tslib - "selected device uses a different version of the event protocol than tslib was compiled for"
initiated me to rethink about item in Buildroot menu under "Kernel" subtree. 
What I don't understand is the meaning of Kernel version? (where I can enter for example 3.2.6) and custom kernel
configuration file - which could be ".config" from directory where are my linux sources (for example 2.6.32).
Questions are - how Buildroot knows where from to take kernel sources (is it directory where ".config" is ?) and 
what in that case means "Kernel version " item ? Which kernel is built - if 3.2.6 then where sources come from 
(Internet ?). Or is it only proper way to set "Kernel version" also?to 2.6.32 according to above examples, but in that 
case where the sources come from ?
?
Regards
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120924/094e19a6/attachment-0001.html>
