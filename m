From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 25 Mar 2009 11:41:37 +0100
Subject: [Buildroot] Build fails with external toolchain (sysroots error)
In-Reply-To: <20090325112430.0c800cea@surf> (Thomas Petazzoni's message of
	"Wed\, 25 Mar 2009 11\:24\:30 +0100")
References: <585ACB2A-2E0B-4AA5-9A71-E437724E4018@laptouchinc.com>
	<20090325112430.0c800cea@surf>
Message-ID: <87skl1j34u.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> I'm not sure what to do with this request :

 Thomas>  *) Say that we officially only support sysroot-able toolchains ;

 Thomas>  *) Work more on the --rpath-link issues, and try to find
 Thomas>     solutions to them (if they ever exist)

I would personally go for only supporting sysroot - It has been
working since 4.2.0, so the non-sysroot toolchains are bound to
disappear relatively soon.

But ofcourse, if someone wants to work on support for !sysroot (and
the patches are not to dirty), then we can include that as well.

-- 
Bye, Peter Korsgaard
