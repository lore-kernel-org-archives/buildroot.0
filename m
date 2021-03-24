From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Mar 2021 14:08:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/dhcpcd: add DHCPCD_CPE_ID_VENDOR
In-Reply-To: <20210320184157.445846-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 20 Mar 2021 19:41:57 +0100")
References: <20210320184157.445846-1-fontaine.fabrice@gmail.com>
Message-ID: <87ft0kn1hg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > cpe:2.3:a:dhcpcd_project:dhcpcd is a valid CPE identifier for this
 > package:

 >   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adhcpcd_project%3Adhcpcd

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

 > ---
 >  package/dhcpcd/dhcpcd.mk | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
 > index 30f0aab867..e598d8939d 100644
 > --- a/package/dhcpcd/dhcpcd.mk
 > +++ b/package/dhcpcd/dhcpcd.mk
 > @@ -10,6 +10,7 @@ DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
 >  DHCPCD_DEPENDENCIES = host-pkgconf
 >  DHCPCD_LICENSE = BSD-2-Clause
 >  DHCPCD_LICENSE_FILES = LICENSE
 > +DHCPCD_CPE_ID_VENDOR = dhcpcd_project
 
 >  DHCPCD_CONFIG_OPTS = \
 >  	--libexecdir=/lib/dhcpcd \
 > -- 
 > 2.30.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
