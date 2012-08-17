From: Zoran Djordjevic <djdjdjole@yahoo.com>
Date: Fri, 17 Aug 2012 05:47:09 -0700 (PDT)
Subject: [Buildroot] external toolchain
Message-ID: <1345207629.82252.YahooMailNeo@web164603.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello
?
I am using buildroot to build RFS with external toolchain support.
When using?Crosstool- NG, it builds OK, but on my target I got
an error- saying "kernel too old". Seems to me that there is no other
way out (is it so ?) knowing that 2.6.32 is the?latest?kernel that I 
found for my board.?So I tried with Sourcery Code Bench ARM2009q1. 
While building, it shows an error, regarding libev - saying:
"memory fences not defined for your architecture, please report".
I don't know the meaning and apparently how to avoid that (if
possible), so I ask myself can I?miss?building libev (or better how
can I solve above mentined issue) ?? In fact I can avoid it, by simple
uncheking appropriate check box, ?but what consequences?can be then ?
?
Best regards
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120817/7171a513/attachment.html>
