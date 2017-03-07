From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Mar 2017 11:31:48 +0100
Subject: [Buildroot] [PATCH 1/1] dc3dd: new package
In-Reply-To: <20170307094050.3ee1650a@armant.office.greenbone.net>
References: <1488607456-30096-1-git-send-email-benoit.allard@greenbone.net>
 <043238f2-3640-b9c7-c86b-28c31e8c44d5@mind.be>
 <20170306165720.28face21@armant.office.greenbone.net>
 <4dccae11-d7e8-1dd8-2797-1336326fa392@mind.be>
 <20170307094050.3ee1650a@armant.office.greenbone.net>
Message-ID: <47dd2cff-1296-4c41-20d0-738fcce26b6b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-03-17 09:40, Beno?t Allard wrote:
> Here, the files that have a copyright header and no "or later" stanza:
> 
> The following three are "freely distributable":
> ./src/hdparm/identify.c: UNKNOWN
> ./src/hdparm/hpa_dco.c: UNKNOWN
> ./src/hdparm/sgio.c: UNKNOWN

 These we can ignore.


> The following files are actually extracted from the GNU C library:
> ./lib/strcspn.c: GPL
> ./lib/stpcpy.c: GPL
> ./lib/strtoull.c: GPL
> ./lib/putenv.c: GPL
> ./lib/strtol.c: GPL
> ./lib/memcmp.c: GPL
> ./lib/stpncpy.c: GPL
> ./lib/memchr.c: GPL
> ./lib/utime.c: GPL
> ./lib/utimens.c: GPL
> ./lib/memchr2.c: GPL

 Something wrong with your version of licensecheck, because they clearly state
"version 3 or any later version". My licensecheck (sid, 3.0.29-1) correctly
identifies them as GPLv3+.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
