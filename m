From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Oct 2015 10:22:15 +0200
Subject: [Buildroot] [PATCH] mplayer: bump to version 1.2
In-Reply-To: <1444138974-30218-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Tue, 6 Oct 2015 14:42:54 +0100")
References: <1444138974-30218-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <871td7nl54.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > - Bump to version 1.2
 > - Update hash file.
 > - Remove no longer existent configure options:
 >   --disable-dvdread-internal, --disable-tremor-internal.
 > - Tweak 0001-disable-install-strip.patch.
 > - Remove 0002-fix-cc-parsing.patch. Upstreamed:
 >   https://github.com/pigoz/mplayer-svn/commit/0f3ddfe146b8b2c6fe9302017375ef6b30ffbe71
 > - Remove 0004-add-arc-support.patch. Upstreamed:
 >   https://github.com/pigoz/mplayer-svn/commit/3b8c5f22313a416b24dcc4e7facde0a886352a75
 > - Remove 0005-Support-newer-GIFLIB-versions.patch. Upstreamed:
 >   https://github.com/pigoz/mplayer-svn/commit/a0ddaef5457e222dade386901bf448c5e3ac7b89
 > - Remove 0006-Support-newer-GIFLIB-versions-part2.patch. Upstreamed:
 >   https://github.com/pigoz/mplayer-svn/commit/a43d259602723d92db1463b166739fb8d22c2d51
 > - Remove 0007-mplayer-enable-aarch64.patch. Upstreamed:
 >   https://github.com/pigoz/mplayer-svn/commit/1cceebf1fa0cc1b27429e937f1cfa61c406f9159
 > - Rename 0003-mpdemux-live555-async-interface.patch to
 >   0002-mpdemux-live555-async-interface.patch.

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
