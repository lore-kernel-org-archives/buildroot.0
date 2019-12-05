From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Dec 2019 22:27:55 +0100
Subject: [Buildroot] [git commit] package/openvmtools: udev rules files
 should not be executable
In-Reply-To: <20191201180305.A556C8347B@busybox.osuosl.org> (Peter Korsgaard's
 message of "Sun, 1 Dec 2019 19:01:14 +0100")
References: <20191201180305.A556C8347B@busybox.osuosl.org>
Message-ID: <87k17apin8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=7ad22f41b57fb244f2f396533d549f7d9eaa5a06
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > /usr/lib/udev/rules.d/99-vmware-scsi-udev.rules is marked executable,
 > causing systemd to complain.

 > Source: https://github.com/vmware/open-vm-tools/pull/376

 > Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
