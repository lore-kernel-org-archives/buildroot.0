From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Aug 2020 20:03:12 +0200
Subject: [Buildroot] [git commit] package/systemd: needs kernel options
In-Reply-To: <20200727152220.9FB6486CA5@busybox.osuosl.org> (Peter Korsgaard's
 message of "Mon, 27 Jul 2020 17:27:09 +0200")
References: <20200727152220.9FB6486CA5@busybox.osuosl.org>
Message-ID: <87r1sa5spr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=8084b809ece3ed48014316ce6881914a6749632f
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > according to https://wiki.gentoo.org/wiki/Systemd#Kernel

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 > [Peter: drop optional CGROUP_BPF / BPF_SYSCALL, unused POSIX_MQUEUE and
 >  DEVTMPFS which is already taken care of by linux.mk]
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
