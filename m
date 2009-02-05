From: Sven Neumann <s.neumann@phase-zero.de>
Date: Thu, 05 Feb 2009 10:59:14 +0100
Subject: [Buildroot] gcc 4.3.3 anyone?
In-Reply-To: <873aewhadh.fsf@macbook.be.48ers.dk>
References: <1233594146.6464.6.camel@sven> <873aewhadh.fsf@macbook.be.48ers.dk>
Message-ID: <1233827954.6323.3.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, 2009-02-02 at 21:06 +0100, Peter Korsgaard wrote:

>  Sven> I've ran into what appears to be a bug in gcc 4.3.2 and reported it
>  Sven> here: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=39076

The gcc people have fixed this problem in the gcc-4.3 branch. I verified
that the patch fixes the compiler segfault when compiling flac. Attached
is a patch for buildroot that incorporates this fix for gcc 4.3.2.

I also noticed that two of the patches in toolchain/gcc/4.3.2 don't end
in .patch and thus are not applied. Is this intentional?


Sven


-------------- next part --------------
A non-text attachment was scrubbed...
Name: gcc-bugfix.diff
Type: text/x-patch
Size: 908 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090205/bbc89c33/attachment.bin>
