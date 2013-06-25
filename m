From: Jan Pohanka <xhpohanka@gmail.com>
Date: Tue, 25 Jun 2013 09:58:00 +0200
Subject: [Buildroot] using a variable within a buildroot menuconfig
Message-ID: <51C94D88.5080707@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I have another /weird/ question.

I would like to know if it is possible to create an item in 
configuration which will for example contain some (absolute) path on my 
filesystem. Then I would like to use this variable for example in 
--extra-cflags configure option for applications like ffmpeg etc.

I know that it is not very nice way, but I need to integrate buildroot 
with Texas Instruments SDK, which is not very GNU build tools friendy.

best regards
Jan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130625/2a4f55c8/attachment.html>
