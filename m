From: Dwi Sasongko Supriyadi <ruckuus@gmail.com>
Date: Wed, 22 Jun 2011 12:50:34 +0700
Subject: [Buildroot] Support for pcsc-lite and libudev
Message-ID: <BANLkTikNYYRS9uxHW6yjHqZ-NF_JACJ5AQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello list,

I am working on pcsc-lite, ccid, libnfc with buildroot. Currently I am
testing it on our system with ARM v6 processor and ACRU-122 reader.

I saw pcsc-lite has an option to use libudev which is not available on
buildroot 2011.05-git. I have checked on the *probably old* archive that the
newer version of libudev has conflicts with buildroot's uClibc. Before
sending patch for pcsc-lite, ccid, and libnfc, I would like to know the
status on this.

Could anyone help me?

Thanks in advance,
DWI


--
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110622/061a6426/attachment.html>
