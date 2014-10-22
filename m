From: Ray Cordova <rayzinpwr@gmail.com>
Date: Wed, 22 Oct 2014 11:06:53 -0700
Subject: [Buildroot] SERIOUS bug in coreutils / cut command
Message-ID: <CAKat-EbixBqGzvLhR_utUyWKTknWF3S7=TNqfJJai1JfgOohkQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

echo "word1 word2 word3" | cut -d' ' -f1

word1

echo "word1 word2 word3" | cut -d' ' -f2

wword2 <-- ??!?!??

Yes, it really is 'wword2'.

echo "word1 word2 word3" | cut -d' ' -f3

word3

This is the September 1st, 2014 release. Coreutils 8.22. Two different
builds, same versions, same bug.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141022/195628ad/attachment.html>
