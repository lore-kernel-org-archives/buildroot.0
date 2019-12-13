From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Dec 2019 16:14:28 +0100
Subject: [Buildroot] [PATCH] python-pylibftdi: Fix LICENSE hash
In-Reply-To: <20191213084250.85816-1-christian.kellermann@solectrix.de>
 (Christian Kellermann's message of "Fri, 13 Dec 2019 09:42:50 +0100")
References: <20191213084250.85816-1-christian.kellermann@solectrix.de>
Message-ID: <878snggsvf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Kellermann <christian.kellermann@solectrix.de> writes:

The title should use a 'package/python-pylibftdi' prefix and you forgot
your signed-of-by and to describe when this was introduced and what the
change was. Given how trivial the fix is I still applied after adjusting
the commit message to be:

package/python-pylibftdi: Fix LICENSE hash after 0.18.1 bump

Commit dd90d40b5226 (package/python-pylibftdi: bump version to 0.18.1)
bumped the version of the package but failed to take into account the change
of copyright year in the license file:

-Copyright (c) 2010-2018 Ben Bass
+Copyright (c) 2010-2019 Ben Bass

Adjust the license file to match the new content.

Signed-off-by: Christian Kellermann <christian.kellermann@solectrix.de>
[Peter: extend commit message, add SOB]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > ---
 >  package/python-pylibftdi/python-pylibftdi.hash | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/python-pylibftdi/python-pylibftdi.hash b/package/python-pylibftdi/python-pylibftdi.hash
 > index ead3c9652a..62dac5cbbf 100644
 > --- a/package/python-pylibftdi/python-pylibftdi.hash
 > +++ b/package/python-pylibftdi/python-pylibftdi.hash
 > @@ -2,4 +2,4 @@
 >  md5	c48e442cef7b1e865b4d96ab92f509ad pylibftdi-0.18.1.tar.gz
 >  sha256	bdd04076933959b20b3c8b4fb8be7882d3362675f259e7eeb23ebff03b81859d  pylibftdi-0.18.1.tar.gz
 >  # Locally computed sha256 checksums
 > -sha256	581b6a16b3aaf23c4f7caee5defa099af833a95916e57ef24d7c12f893a0c160  LICENSE.txt
 > +sha256  0e40132339e1ef7d17d93837fbc273d1e87302e9295162bd19c9161e5700ddcc  LICENSE.txt
 > -- 
 > 2.23.0

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
