From: Mathieu Slabbinck <matty.slabbinck@gmail.com>
Date: Tue, 2 Jun 2015 09:57:29 +0200
Subject: [Buildroot] Nodejs 0.10.36 execvp: printf: Argument list too long
Message-ID: <CAOFH_kHEookn4NDJBujS7pizjt9QuX4qQMgx3ks6N01CdRd=Pw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm having trouble building nodjes for my target getting following error:

make[2]: execvp: printf: Argument list too long

I found a patch related to this but this is for 0.8 and using the patch
results in a broken build.
http://patchwork.openembedded.org/patch/72811/

Anyone have any idea how to fix this?

Kr

Mathieu
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150602/7d576211/attachment.html>
