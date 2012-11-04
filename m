From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 04 Nov 2012 17:41:14 +0100
Subject: [Buildroot] [RFC 0/2] legal-info: split _LICENSE and
	_REDISTRIBUTE constants
In-Reply-To: <1351848341-5905-1-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Fri, 2 Nov 2012 10:25:39 +0100")
References: <1351848341-5905-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <87sj8ppbh1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 Luca> Hi,
 Luca> this small patchset implements the recent proposal to split the license
 Luca> description (<PKG>_LICENSE) from the fact that a package can be
 Luca> redistributed or not (<PKG>_REDISTRIBUTE).

 Luca> The idea is to let the _LICENSE do its work, i.e. simply describe the
 Luca> license, and add a new _REDISTRUBUTE parameter (defaulting to YES), to
 Luca> specify if the tarball must be copied or not.
 Luca> Defining the license and choosing whether or not to redistribute would
 Luca> become technically independent, which is more correct.

Committed both, thanks.

-- 
Bye, Peter Korsgaard
