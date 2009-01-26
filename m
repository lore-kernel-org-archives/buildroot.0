From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 07:13:01 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/irda-utils
In-Reply-To: <20090126001248.7B942775D3@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Mon\, 26 Jan 2009 00\:12\:48 +0000 \(UTC\)")
References: <20090126001248.7B942775D3@busybox.osuosl.org>
Message-ID: <877i4id28i.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-26 00:12:47 +0000 (Mon, 26 Jan 2009)
 ulf> New Revision: 25036

 ulf> Log:
 ulf> Deprecate irda-utils, makefile totally broken

If it's totally broken, then deprecated isn't the correct
dependency. Instead we should let it depend on BROKEN like I did in
Config.in.arch

-- 
Bye, Peter Korsgaard
