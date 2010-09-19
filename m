From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 19 Sep 2010 22:44:06 +0200
Subject: [Buildroot] m4 seems to have a dependency to WCHAR-SUPPORT
In-Reply-To: <4C8FE64E.8090508@googlemail.com> (Marcus Osdoba's message of
	"Tue, 14 Sep 2010 23:17:02 +0200")
References: <4C8FE64E.8090508@googlemail.com>
Message-ID: <87eicp4g6h.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marcus" == Marcus Osdoba <marcus.osdoba@googlemail.com> writes:

 Marcus>  Hello mailinglist,
 Marcus> I'm trying to build a rootfs without WCHAR support for util-linux-ng
 Marcus> integration test purposes.
 Marcus> It seems, that m4 has a dependency to WCHAR.
 Marcus> The build breaks with current git tree and deactivated WCHAR
 Marcus> support. I'm pretty sure that it worked before unselecting WCHAR.

Thanks, fixed (or rather marked) in git.

-- 
Bye, Peter Korsgaard
