From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 May 2021 23:29:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/refpolicy: fix
 REFPOLICY_CPE_ID_VENDOR
In-Reply-To: <20210515112527.2367702-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 15 May 2021 13:25:27 +0200")
References: <20210515112527.2367702-1-fontaine.fabrice@gmail.com>
Message-ID: <87mtstgibg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > cpe:2.3:a:selinuxproject:refpolicy is a valid CPE identifier for this
 > package:

 >   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aselinuxproject%3Arefpolicy

 > Indeed, cpe:2.3:a:tresys:refpolicy has been deprecated since April 21th:

 >   <cpe-item name="cpe:/a:tresys:refpolicy:2.20180701" deprecated="true" deprecation_date="2021-04-21T16:55:43.710Z">
 >     <title xml:lang="en-US">Tresys refpolicy 2.20180701</title>
 >       <reference href="https://github.com/TresysTechnology/refpolicy">Product</reference>
 >     <cpe-23:cpe23-item name="cpe:2.3:a:tresys:refpolicy:2.20180701:*:*:*:*:*:*:*">
 >         <cpe-23:deprecated-by name="cpe:2.3:a:selinuxproject:refpolicy:2.20180701:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
