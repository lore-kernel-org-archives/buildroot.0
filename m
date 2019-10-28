From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Oct 2019 14:26:21 +0100
Subject: [Buildroot] [git commit] board/freescale/imx6-sabresd: improve
 Qt5 Cinematic Demo instructions
In-Reply-To: <20191010203129.C5C928CA03@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Thu, 10 Oct 2019 22:31:55 +0200")
References: <20191010203129.C5C928CA03@busybox.osuosl.org>
Message-ID: <875zk96lxe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=d9ccd8f0fc206805deca4ce6ae6b81480a1ead95
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > QT_QPA_EGLFS_ALWAYS_SET_MODE=1 needs to be exported, otherwise the Qt5
 > Cinematic demo throws a storm of the following messages:

 > Could not queue DRM page flip on screen LVDS1 (Invalid argument)

 > Improve the instructions by mentioning such requirement.

 > Signed-off-by: Fabio Estevam <festevam@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
