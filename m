From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Nov 2013 00:14:50 +0100
Subject: [Buildroot] [PATCH 2 of 3] infra: remove incorrect default for
	FOO_DIR_PREFIX
In-Reply-To: <d03022b206c995b8b942.1383841612@argentina> (Thomas De
 Schampheleire's message of "Thu, 07 Nov 2013 17:26:52 +0100")
References: <patchbomb.1383841610@argentina>
 <d03022b206c995b8b942.1383841612@argentina>
Message-ID: <8738n3c0id.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

> Variable FOO_DIR_PREFIX is populated from pkgparentdir by the various
> package infrastructures. However, if that would be empty (which in fact is
> the case for the linux package), FOO_DIR_PREFIX would be set to
> '$(TOP_SRCDIR)/package'.
> Not only does this make no sense (LINUX_DIR_PREFIX becomes /package/linux,
> and for all other packages pkgparentdir is not-empty anyway), but it is also
> using a non-existing variable TOP_SRCDIR.
> This patch therefore removes the incorrect default.

> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
