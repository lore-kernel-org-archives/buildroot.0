From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Nov 2013 00:15:20 +0100
Subject: [Buildroot] [PATCH 3 of 3] infra: clean up 'Patching' message
In-Reply-To: <0f8364943e3955dbed38.1383841613@argentina> (Thomas De
 Schampheleire's message of "Thu, 07 Nov 2013 17:26:53 +0100")
References: <patchbomb.1383841610@argentina>
 <0f8364943e3955dbed38.1383841613@argentina>
Message-ID: <87y54valx3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

> The 'Patching' message in the generic infrastructure prints not only the
> package name, but also a reference to the assumed package directory, based
> on FOO_DIR_PREFIX/FOO_RAWNAME. This doesn't really add value, as the name
> of the package is already apparent from the message and its location should
> be obvious. Hence, this patch simply reduces the print to "Patching".

> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
