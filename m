From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 06 Mar 2021 11:19:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/expat: update CPE variables
In-Reply-To: <20210306095311.2155649-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 6 Mar 2021 10:53:11 +0100")
References: <20210306095311.2155649-1-fontaine.fabrice@gmail.com>
Message-ID: <87im64a8k0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > libexpat:expat has been replaced by libexpat_project:libexpat:
 >   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibexpat_project%3Alibexpat

 >   <cpe-item name="cpe:/a:libexpat:expat:2.2.10" deprecated="true" deprecation_date="2021-01-25T15:44:50.537Z">
 >     <title xml:lang="en-US">libexpat Expat 2.2.10</title>
 >       <reference href="https://github.com/libexpat/libexpat/">Version</reference>
 >     <cpe-23:cpe23-item name="cpe:2.3:a:libexpat:expat:2.2.10:*:*:*:*:*:*:*">
 >         <cpe-23:deprecated-by name="cpe:2.3:a:libexpat_project:libexpat:2.2.10:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
