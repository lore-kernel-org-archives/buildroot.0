From: David Wuertele <dave+buildroot@wuertele.com>
Date: Tue, 21 Feb 2017 11:08:10 -0800
Subject: [Buildroot] How to organize build into multiple target filesystems?
Message-ID: <CABKRrCWcWO3MNBnFK9fAoaYoGQBNn2eN=ZvZYovHvV1jwYQbSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I would like my target to have a small initramfs, and a large-ish /usr
filesystem mounted at runtime.  The initramfs will be populated with some
of my
packages, the usr fs will be populated with the rest.  I don't want the
initramfs to contain anything under usr except for the /usr mountpoint
directory.

In general, I'm looking for a way to divert my package outputs into an
arbitrary number of filesystems, which I then package in various ways,
including but not limited to bundling into a kernel initramfs.

Is there a way to specify such an organization in buildroot?

Thanks,
Dave
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170221/2c473a67/attachment.html>
