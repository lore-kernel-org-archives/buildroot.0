From: Bernhard Fischer <rep.nop@aon.at>
Date: Wed, 22 Nov 2006 21:04:54 +0100
Subject: [Buildroot] Error compiling svn revision 16632.
In-Reply-To: <1d09f8b80611221150j5f12383fl1f4cb914f9c0d733@mail.gmail.com>
References: <1d09f8b80611221150j5f12383fl1f4cb914f9c0d733@mail.gmail.com>
Message-ID: <20061122200454.GC1863@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 22, 2006 at 02:50:42PM -0500, Will Buik wrote:
>I used svn to checkout the latest revision 16632 and set up default
>configuration with make menuconfig, but when trying to compile I
>immidatly get the error:
>target/cpio/cpioroot.mk:10: *** missing separator.  Stop.

oh well.
Fixed. Thanks for pointing this out.
