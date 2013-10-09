From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Oct 2013 15:20:57 +0200
Subject: [Buildroot] [PATCHv3 06/20] toolchain-external: convert to the
	package infrastructure
In-Reply-To: <1381256237-27948-7-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 8 Oct 2013 20:17:03 +0200")
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381256237-27948-7-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8761t64m2u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This commit converts the 'toolchain-external' logic to the package
 Thomas> infrastructure.

 Thomas> The TOOLCHAIN_EXTERNAL_DIR variable (which points to where the
 Thomas> toolchain is located) is renamed to TOOLCHAIN_EXTERNAL_INSTALL_DIR,
 Thomas> because the former conflicts with the package infrastructure (which
 Thomas> defines the <pkg>_DIR variable for each package as pointing to its
 Thomas> build directory).

 Thomas> The new _EXTRA_DOWNLOADS mechanism is used for Blackfin toolchains.

 Thomas> The extract, configuration and installation steps are converted inside
 Thomas> the <pkg>_EXTRACT_CMDS, <pkg>_CONFIGURE_CMDS and
 Thomas> <pkg>_INSTALL_STAGING_CMDS.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
