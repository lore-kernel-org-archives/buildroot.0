From: Gregory Perry <Gregory.Perry@govirtual.tv>
Date: Tue, 19 Feb 2013 19:34:36 +0000
Subject: [Buildroot] SSHFS userland support
Message-ID: <718DFA7882181D45B8BD18F31C46D55427A6A7E0@MBX204.domain.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello list members!

I am doing a buildroot integration for an i386 target but I can't for the life of me figure out how to include SSHFS userland support (the SSHFS binary itself.  I've selected the FUSE filesystem dependencies as well as support for OpenSSH, but the sshfs binary needed to instantiate an SSH/FUSE connection is not present in the target.

Maybe this is a dependency issue, or did I miss an SSHFS config option in the menuconfig?

Thanks in advance
