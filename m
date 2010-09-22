From: Yoann Sculo <yoann.sculo@gmail.com>
Date: Wed, 22 Sep 2010 14:45:49 +0200
Subject: [Buildroot] Introduction of mpd into buildroot ?
Message-ID: <AANLkTimZa473TfBgFhoXMhR_fiusyduFvdo-YuMzs84T@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've been following buildroot mailing list for a while.
Now I'm interested in contributing and submitting some patches for
applications I've been working on.
Has someone ever tried to introduce mpd (the daemon one, not the library)
into buildroot ?

I've successfully built mpd for arm920t and think it could be interesting to
introduce this package.

First, I'd like to have your opinion about pkg-config files. libmad-0.15.1
for example doesn't provide the small file mad.pc
This is surprising, It does'nt seem to be distributed with libmad sources.
The probem is I need actually this file to compile mpd. Adding it manually,
works fine.

So I would be inclined to create a patch into package/multimedia/libmad to
add this file during mpd installation. Is it the better way to do this ?

Well, if mpd has never been added into buildroot I'm interested to work on
it.

Thanks

Yoann Sculo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100922/e2992592/attachment.html>
