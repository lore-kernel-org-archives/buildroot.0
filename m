From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Jan 2019 16:00:57 +0100
Subject: [Buildroot] [PATCH] package/docker-containerd: add missing
 dependency on host-pkgconf
In-Reply-To: <20181228150740.29890-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 28 Dec 2018 16:07:40 +0100")
References: <20181228150740.29890-1-thomas.petazzoni@bootlin.com>
Message-ID: <8736pq3t92.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > When libsseccomp support is enabled, docker-containerd uses pkg-config
 > to find libsseccomp, so we must depend on host-pkconf.

 > Fixes the following build issue, detected with per-package directory
 > support:

 > pkg-config: exec: "pkg-config": executable file not found in $PATH

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
