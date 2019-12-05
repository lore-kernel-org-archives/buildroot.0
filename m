From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Dec 2019 22:27:43 +0100
Subject: [Buildroot] [git commit] package/openvmtools: use correct
 variable in udev rule RUN+=
In-Reply-To: <20191201180305.AFADE83480@busybox.osuosl.org> (Peter Korsgaard's
 message of "Sun, 1 Dec 2019 19:06:25 +0100")
References: <20191201180305.AFADE83480@busybox.osuosl.org>
Message-ID: <87o8wmpink.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=164963b80875b8d23062179bf2d92a9896a2a0a7
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > DEVPATH is not a valid substitution in a RUN+=, devpath is:
 > https://mirrors.edge.kernel.org/pub/linux/utils/kernel/hotplug/udev/udev.html

 > So use that to get rid of the following warning:

 > Invalid value "/bin/sh -c 'echo 180 >/sys$DEVPATH/device/timeout'" for RUN
 > (char 27: invalid substitution type), ignoring, but please fix

 > Source: https://github.com/vmware/open-vm-tools/pull/376

 > Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
 > Acked-by: J?r?my Rosen <jeremy.rosen@smile.fr>
 > [Peter: extend description]
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
