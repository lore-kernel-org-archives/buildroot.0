From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 05 May 2019 21:05:30 +0200
Subject: [Buildroot] [PATCH] package/libglib2: avoid printing null
 strings
In-Reply-To: <20190504194415.1121-1-grzegorz@blach.pl> (Grzegorz Blach's
 message of "Sat, 4 May 2019 19:44:13 +0000")
References: <20190504194415.1121-1-grzegorz@blach.pl>
Message-ID: <87k1f4bu2t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grzegorz" == Grzegorz Blach <grzegorz@blach.pl> writes:

 > GCC 9 is being stricter about passing null string pointers
 > to printf-like functions.

 > Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>

 > ---
 > Changes v1 -> v2:
 >   - Patch taken from glib repository has been signed off by me.

check-package still complains:

package/libglib2/0003-gdbus-Avoid-printing-null-strings.patch:4: generate your patches with 'git format-patch -N'

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
