From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 23 Aug 2016 21:51:44 +0200
Subject: [Buildroot] [PATCHv2/next 2/4] DEVELOPERS: add initial list of
 Buildroot developers
In-Reply-To: <1471956466-22338-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1471956466-22338-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1471956466-22338-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <fb83b7f7-40e5-62ab-5d9e-ea04cd8d8df6@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 23/08/2016 ? 14:47, Thomas Petazzoni a ?crit :
> This is an initial list of Buildroot developers. It has been created
> semi-automatically by parsing the Git history, and finding the authors
> of commits with a title like "<foo>: new package". Some additional
> manual tweaking has been done (merging multiple entries corresponding to
> the same person, adding some more entries, etc.).
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---

> +
> +N:	Julien Boibessot <julien.boibessot@armadeus.com>
> +F:	configs/armadeus*
> +F:	package/libcddb/

I guess Julien want to take care of opentyrian :)

> +
> +N:	Nicolas Menegale <nicolas.menegale@openwide.fr>
> +F:	package/cppcms/
> +F:	package/glibmm/
> +F:	package/libxmlpp/

Nicolas no longer works for Open Wide, so these packages are orphan I guess.
Also, I'm not sure he still on the mailing list.

> +N:	Romain Naour <romain.naour@openwide.fr>

Please update my address with romain.naour at gmail.com

> +F:	package/bullet/
> +F:	package/efl/
> +F:	package/iqvlinux/
> +F:	package/liblinear/
> +F:	package/mcelog/
> +F:	package/openpowerlink/
> +F:	package/stress-ng/
> +F:	package/terminology/

Here are some missing packages:
+F: package/elementary/
+F: package/expedite/
+F: package/xenomai/

> +N:	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[snip]
> +F:	package/enlightenment/
> +F:	package/libevas-generic-loaders/

Thomas, I'd like to take these two packages on my list ;-)

Also some packages are not listed yet, like busybox.
I could be interesting to list all orphan packages.

Best regards,
Romain
