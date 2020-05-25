From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 May 2020 22:54:00 +0200
Subject: [Buildroot] [PATCH] package/qemu: remove csky fork
In-Reply-To: <20200522232212.2909156-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sat, 23 May 2020 01:22:12 +0200")
References: <20200522232212.2909156-1-romain.naour@gmail.com>
Message-ID: <878shfivmf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > We have a qemu fork for csky cpus [1] but since qemu version
 > bump to 4.2.0 [2] and libssh2/libssh change the csky build is
 > broken.

 > The csky fork is based on Qemu 3.0.0 but unlike autotools packages
 > any unknown option is handled as error.

 > Since we don't want to support all options from previous qemu
 > release and the github repository has been removed [3] and the
 > only remaining archive is located on http://sources.buildroot.net,
 > remove the qemu csky fork as suggested by [4].

 > [1] https://git.buildroot.net/buildroot/commit/?id=f816e5b276f1ef15840bec6667f1e8219717ab7d
 > [2] https://git.buildroot.net/buildroot/commit/?id=0ea17054ce7dfc54efca5634133cef786445e7b1
 > [3] https://github.com/c-sky/qemu
 > [4] http://lists.busybox.net/pipermail/buildroot/2020-May/281885.html

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Guo Ren <ren_guo@c-sky.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks. I also moved the patches out of the (now unneeded)
4.2.0 subdir.

Guo, please resubmit c-sky support for qemu when it is included upstream
- Thanks.

-- 
Bye, Peter Korsgaard
