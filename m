From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Date: Mon, 17 Aug 2020 17:36:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/openlayers: bump to version
 6.4.3
In-Reply-To: <CAHpTZwkUZK_keH1wvjDFvKLF9DgTWp1QYCAqZGKzL32U8yLPmw@mail.gmail.com>
References: <20200430095332.98544-1-thomas.claveirole@green-communications.fr>
 <20200817144304.235841-1-thomas.claveirole@green-communications.fr>
 <CAHpTZwkUZK_keH1wvjDFvKLF9DgTWp1QYCAqZGKzL32U8yLPmw@mail.gmail.com>
Message-ID: <13659576.xXyXIKi9BV@houde>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jugurtha,

> It would be great if you can add LICENSE HASH value (LICENSE.md
> <https://github.com/openlayers/openlayers/blob/main/LICENSE.md
> >) as well to the hash file.

As stated in the openlayers.mk file:

# There's no separate license file in the archive, only minified files.


I don't think I should add a license hash in the .hash file for a
file that does not exist in the archive we do download.  Is there
something I misunderstood?

Cheers,
-- 
Thomas Claveirole <thomas.claveirole@green-communications.fr>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200817/2f259461/attachment.asc>
