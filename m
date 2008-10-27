From: Adam McLaurin <buildroot@irotas.net>
Date: Mon, 27 Oct 2008 09:08:23 -0400
Subject: [Buildroot] Unable to create files inside mounted root filesystem
Message-ID: <1225112903.16248.1281448757@webmail.messagingengine.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I hope this is a typical newbie question. I was finally able to create a
root filesystem (ext2) with buildroot, and I can mount (-o loop) and
chroot into it with no problems.

The trouble is that I cannot create any files in the mounted filesystem:
/ # touch foo
touch: foo: No space left on device

Strangely, when I mount/chroot into one of the pre-built root
filesystems available from the uclibc website, I can create files
without any problems.

I'm trying to figure out what I did differently creating my root
filesystem that would cause this problem, but at the moment I'm out of
ideas.

Any advice?

Thanks,
Adam
