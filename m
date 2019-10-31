From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 09:13:37 +0100
Subject: [Buildroot] [git commit] package/vdr-plugin-vnsiserver: don't
 install i18n files when not needed
In-Reply-To: <20191026074058.54B0F88166@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sat, 26 Oct 2019 09:46:10 +0200")
References: <20191026074058.54B0F88166@busybox.osuosl.org>
Message-ID: <87d0edz61a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=d9ed9b6d5925aa44185addccc15064d5af2af190
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > This used to cause a build failure with gettext-tiny, but this is now
 > fixed by the version bump in 160f0a033ba4edf2f7efe5fed82426acd3b34b70
 > ("package/gettext-tiny: bump version"). Nevertheless, it makes sense
 > to not install the i18n files when they are not needed, i.e when
 > BR2_SYSTEM_ENABLE_NLS is disabled.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Reviewed-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.08.x, thanks (2019.02.x does not have gettext-tiny).

-- 
Bye, Peter Korsgaard
