From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 Oct 2014 23:12:03 +0200
Subject: [Buildroot] [PATCH 1/3] package/libva: Bump version to 1.4.0
In-Reply-To: <20141007210631.GA27580@free.fr> (Yann E. MORIN's message of
 "Tue, 7 Oct 2014 23:06:31 +0200")
References: <1412623692-3322-1-git-send-email-bernd.kuhls@t-online.de>
 <87ppe3fwnn.fsf@dell.be.48ers.dk>
 <XnsA3BFE9C44990FberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20141007210631.GA27580@free.fr>
Message-ID: <878ukrfuu4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > ... there are a few other good reasons we accept hashes:

 >   - it ensures a broken download is detected, so the user quickly knows
 >     that the tarball is broken because of the download; sometimes,
 >     upstreams breaks their distributions (e.g. the recent sourceforge
 >     breakage...).

 >   - non-compliant downloads are removed (rm -f) so they are not
 >     accidentally used in another context (e.g. I do share my BR2_DL_DIR
 >     with other stuff).

 >   - consequently, it helps the autobuilders prune their failed
 >     downloads.

 > But in the end there is no clear policy, except:

 >   - we *do* want hashes for security-related packages;
 >   - hashes for other packages are a nice bonus.

Agreed. It is in no way required, but nice - Especially if upstream
posts hashes.

-- 
Bye, Peter Korsgaard
