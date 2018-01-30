From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Jan 2018 23:50:17 +0100
Subject: [Buildroot] [git commit] system: only expose getty options for
 busybox and sysvinit
In-Reply-To: <20180112210924.2C66382BCA@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Fri, 12 Jan 2018 22:07:59 +0100")
References: <20180112210924.2C66382BCA@busybox.osuosl.org>
Message-ID: <87bmhb9d1y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=5e23eb5da7b3848cc6b317af9d8c23aac3a13260
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Only busybox and sysvinit handle the BR2_TARGET_GENERIC_GETTY_TERM and
 > BR2_TARGET_GENERIC_GETTY_OPTIONS options; the other init systems do
 > not.

 > So, protect those options behind appropriate dependencies on busybox
 > or sysvinit.

 > Fixes #10301.

 > Reported-by: Michael Heinemann <posted@heine.so>
 > Suggested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
