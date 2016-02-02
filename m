From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Feb 2016 14:03:44 +0100
Subject: [Buildroot] [PATCH] kodi,
	mpd: fix samba4 related dependency mistakes
In-Reply-To: <1454400766-10041-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 2 Feb 2016 09:12:46 +0100")
References: <1454400766-10041-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87mvrj5knj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit fixes the following kconfig warning:
 >    warning: (BR2_PACKAGE_KODI_LIBSMBCLIENT && BR2_PACKAGE_MPD_LIBSMBCLIENT) selects BR2_PACKAGE_SAMBA4 which has unmet direct dependencies (!BR2_PACKAGE_SAMBA && BR2_USE_MMU && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_NATIVE_RPC && BR2_TOOLCHAIN_HAS_THREADS && !BR2_STATIC_LIBS && !BR2_nios2)

 > by updating the kodi and mpd Config.in files to properly take into
 > account the dependencies of the BR2_PACKAGE_SAMBA4 option that they
 > select.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
