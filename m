From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 21:03:10 +0100
Subject: [Buildroot] [PATCH] package/libpam-tacplus: remove duplicate
 LIBPAM_TACPLUS_AUTORECONF
In-Reply-To: <20201114145158.1795983-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sat, 14 Nov 2020 15:51:58 +0100")
References: <20201114145158.1795983-1-romain.naour@gmail.com>
Message-ID: <87wnyl3w8x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > The commit [1] added a second LIBPAM_TACPLUS_AUTORECONF
 > because we are now patching configure.ac.
 > But LIBPAM_TACPLUS_AUTORECONF was already used because the
 > package is fetched from github.

 > [1] bd85d82f61af0578a64e74e1cfb56c3c1bf46fe1

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/849509860

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
