From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Jun 2017 16:38:00 +0200
Subject: [Buildroot] [git commit] toolchain-external: adjust musl
	dynamic linker symlink for mips-sf
In-Reply-To: <20170530093954.6D502828B9@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Tue, 30 May 2017 11:39:40 +0200")
References: <20170530093954.6D502828B9@busybox.osuosl.org>
Message-ID: <87a85rixiv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=a6a4a8b2ef1fa747fdc79bc7bae0518417910f5d
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The external toolchain code has some logic to calculate the correct name
 > for the dynamic linker symbolic link that needs to be created when the
 > musl C library is being used. There was already some handling for the
 > mipsel+soft-float case, but not for the mips+soft-float case. Due to
 > this, the symbolic link was incorrectly named, and programs were
 > referencing an non-existing file.

 > Reported-by: Florent Jacquet <florent.jacquet@free-electrons.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
