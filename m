From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 17 Feb 2013 10:52:04 +0100
Subject: [Buildroot] [git commit] libffi: switch to using a Git version,
	brings Microblaze and Xtensa support
In-Reply-To: <CAG2jQ8iKxtdxCTc2DyMTy-3naNtQjWRdonxP8u0e7tVF0tsecA@mail.gmail.com>
 (Markos Chandras's message of "Thu, 14 Feb 2013 17:14:52 +0000")
References: <20130205150055.C510A9A987@busybox.osuosl.org>
 <CAG2jQ8iKxtdxCTc2DyMTy-3naNtQjWRdonxP8u0e7tVF0tsecA@mail.gmail.com>
Message-ID: <87y5enp8sb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <markos.chandras@gmail.com> writes:

Hi,

 Markos> Hi Peter,

 Markos> A new libffi is released[1]. Maybe we should revert to the old
 Markos> Makefile now that a new version is out?
 Markos> I can provide a patch if needed.

 Markos> [1] ftp://sourceware.org/pub/libffi/libffi-3.0.12.tar.gz

Yes, that's probably a good idea. I'm just back from holidays and still
catching up on mails. Do we need to do it for 2013.02? E.G. does it fix
something critical compared to the git version?

-- 
Bye, Peter Korsgaard
