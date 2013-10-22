From: arnaud aujon <arnaud.aujon@gmail.com>
Date: Tue, 22 Oct 2013 19:06:41 +0200
Subject: [Buildroot] Tool to check packages updates
Message-ID: <CACjG4BJq5TXvpMAoU7w3JgTVrOGHpeKng88HU03Rf_=XunPKAQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

As we talk earlier in the mailing list, I started working on a python
script to automatically check if a package can be updated.

For now, the result of the script is : 837 packages (115 up to date, 154
old and 568 unknown)
So the script is able to check that 115 packages are up to dates and that
154 have newer version or that the script is wrong.
There is still a lot of work to have something usefull, I will post the
script as soon as it's ready to be reviewed.

Cheers,

Arnaud
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131022/85f2bfc4/attachment-0001.html>
