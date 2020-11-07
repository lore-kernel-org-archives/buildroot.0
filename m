From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 07 Nov 2020 18:42:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/libass: bump to version 0.15
In-Reply-To: <20201029132429.392911-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 29 Oct 2020 14:24:29 +0100")
References: <20201029132429.392911-1-fontaine.fabrice@gmail.com>
Message-ID: <87pn4pxdvc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - harfbuzz is mandatory since
 >   https://github.com/libass/libass/commit/f3e2c97e1818598afb0b1c7010003ffe4823ff21
 > - Fix CVE-2020-26682 (In libass 0.14.0, the `ass_outline_construct`'s
 >   call to `outline_stroke` causes a signed integer overflow.) through
 >   https://github.com/libass/libass/commit/676f9dc5b52ef406c5527bdadbcb947f11392929
 >   which does not apply cleanly over version 0.14.
 >   It should be noted that version 0.15 also fixes other integer
 >   overflows (which have no CVE assigned)
 > - Update indentation in hash file (two spaces)

 > https://github.com/libass/libass/releases/tag/0.15.0

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
