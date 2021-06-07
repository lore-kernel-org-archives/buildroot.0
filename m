From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 07 Jun 2021 23:14:36 +0200
Subject: [Buildroot] [PATCH] package/ebtables: fix runtime in case of
 BR2_KERNEL_64_USERLAND_32
In-Reply-To: <20210518074628.24811-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Tue, 18 May 2021 09:46:27 +0200")
References: <20210518074628.24811-1-patrickdepinguin@gmail.com>
Message-ID: <87v96pwf5v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > ebtables 2.0.11 no longer works correctly when userland is 32-bit and the
 > kernel is 64-bit. This used to work correctly in version 2.0.10-4.

 > Problem is twofold:
 > - ebtables itself was broken and needs to be patched
 > - buildroot needs to pass the correct flag again to indicate when we are in
 >   this situation

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
