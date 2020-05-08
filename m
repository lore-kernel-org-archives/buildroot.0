From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 May 2020 11:51:09 +0200
Subject: [Buildroot] [git commit] package/wireguard-linux-compat: depend
 on headers < 5.6
In-Reply-To: <20200424122241.994F08FEC1@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Fri, 24 Apr 2020 14:37:03 +0200")
References: <20200424122241.994F08FEC1@busybox.osuosl.org>
Message-ID: <87sggarbzm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=da5afc10a45d1e1b5ab7ab6f9230ed7ba44581e7
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Since wireguard is built into kernels 5.6 and later we can't build
 > wireguard-linux-compat on them, so we need to depend on
 > !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6.

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
