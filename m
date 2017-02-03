From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 4 Feb 2017 00:30:20 +0100
Subject: [Buildroot] [BUILDROOT 2016.11.2] Change kernel version (I need
 4.1.18)
In-Reply-To: <1022335655.874129.1486143487328@mail.yahoo.com>
References: <1022335655.874129.1486143487328.ref@mail.yahoo.com>
 <1022335655.874129.1486143487328@mail.yahoo.com>
Message-ID: <bc0053c5-142a-6bb6-bdfe-bcb731bf0070@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-02-17 18:38, thierry.xenomai43 at yahoo.com wrote:
[snip]
> I modify the "package/xenomai/xenomai.mk" file lick this :
[snip]
> XENOMAI_VERSION = 3.0.3

 When you change a package version, the patches won't apply anymore. For your
particular case, you probably don't care about blackfin so you can just remove
0001-bfin-remove-inline-keyword.patch.

 A word of warning though: the update to Xenomai 3 is pretty major, it is quite
likely that you will encounter more issues.

 Regards,
 Arnout


[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
