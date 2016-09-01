From: yoda zhong <yodazhong@gmail.com>
Date: Thu, 1 Sep 2016 16:17:30 -0700
Subject: [Buildroot] How to build image with added files
In-Reply-To: <fcd9e72c-ef64-0b05-283c-2e545b1d0ab3@mind.be>
References: <57c85f5a.8c4f620a.45d24.2e4a@mx.google.com>
 <fcd9e72c-ef64-0b05-283c-2e545b1d0ab3@mind.be>
Message-ID: <57c8b708.c846620a.9b898.6b89@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you for your answer.

I?ll lookup that overlay feature. Thanks.

For the second part, I need to describe my situation in detail.
Usually I make image and copy them to microSD card which has rootfs and boot partitions.
I use ?make? command to do this.
And in some cases, I modified some files under output/target. But my modification is nulled
when I do ?make? command. For example, I add a script file in output/target, but it disappeared.
I modified output/target/etc/network/interfaces, but added lines disappeared too.
So I thought there?s another way to do this and asked this to here.

Regards,
Jehun

?? ??: Arnout Vandecappelle
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160901/833698a2/attachment.html>
