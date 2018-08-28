From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Aug 2018 16:16:05 +0200
Subject: [Buildroot] [git commit] package/openssh: also install
 ssh-copy-id script
In-Reply-To: <20180305200714.3392B7FD45@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Thu, 8 Feb 2018 23:10:09 +0100")
References: <20180305200714.3392B7FD45@busybox.osuosl.org>
Message-ID: <87efei60gq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=0552b7fc3878d7e446ee082f492845bc33594bba
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > This script is useful to copy SSH keys between client and server [1] and
 > installed on most distributions (for example on debian: [2]).

 > [1] https://www.ssh.com/ssh/copy-id
 > [2] https://packages.debian.org/fr/jessie/armhf/openssh-client/filelist

 > Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > [Thomas: use full destination path.]
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
