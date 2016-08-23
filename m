From: Carlos Santos <casantos@datacom.ind.br>
Date: Tue, 23 Aug 2016 16:50:41 -0300 (BRT)
Subject: [Buildroot] [PATCHv2/next 2/4] DEVELOPERS: add initial list
	of	Buildroot developers
In-Reply-To: <1471956466-22338-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1471956466-22338-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1471956466-22338-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1065867889.672166.1471981841582.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
---8<---
> This is an initial list of Buildroot developers. It has been created
> semi-automatically by parsing the Git history, and finding the authors
> of commits with a title like "<foo>: new package". Some additional
> manual tweaking has been done (merging multiple entries corresponding to
> the same person, adding some more entries, etc.).
---8<---
> +N:	Carlos Santos <casantos@datacom.ind.br>
> +F:	package/gmock/
> +F:	package/perl-file-util/

I can take care of util-linux, too.
---8<---
> +N:	Giovanni Zantedeschi <giovanni.zantedeschi@datacom.ind.br>
> +F:	package/libpam-radius-auth/
> +F:	package/libpam-tacplus/

Giovanni does not work at DATACOM anymore. Please replace by casantos at ...

---8<---
> +N:	Stephan Hoffmann <sho@relinux.de>
> +F:	package/cache-calibrator/
> +F:	package/gtest/

I'm planing to replace gmock and gtest by "googletest" in the near future, so I could take care of gtest if Stefan does not mind. 
---8<---

Carlos Santos (Casantos)
DATACOM, P&D
