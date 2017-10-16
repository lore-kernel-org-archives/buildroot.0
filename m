From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Oct 2017 23:46:07 +0200
Subject: [Buildroot] [git commit] support/scripts/check-bin-arch: fix
	symbolic link check
In-Reply-To: <20170905190117.BA95C80E2F@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Tue, 5 Sep 2017 20:59:04 +0200")
References: <20170905190117.BA95C80E2F@busybox.osuosl.org>
Message-ID: <87infewyu8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=cb0f3fa13f315a1aa0469d3479673860dcba8eb9
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit c96b8675ea03a5d3194d439f740c725dd239ed1a
 > ("support/scripts/check-bin-arch: ignore symbolic links") was bogus,
 > because it tested ${f}, which is the relative path of the file inside
 > ${TARGET_DIR}, so we end up testing if ${f} on the system is a
 > symbolic link.

 > This commit fixes that by testing ${TARGET_DIR}/${f}.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
