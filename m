From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Mar 2020 20:10:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/php: fix build without zlib
In-Reply-To: <20200308170556.165375-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 8 Mar 2020 18:05:56 +0100")
References: <20200308170556.165375-1-fontaine.fabrice@gmail.com>
Message-ID: <877dzuu0hc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Build will fail if zlib is not found and mysqlnd compression support
 > is not disabled since version 7.4.1 and
 > https://github.com/php/php-src/commit/ee4295b4ce421003c2e1d2af98066826deb23319

 > Fixes:
 >  - http://autobuild.buildroot.org/results/9496d81437dba55d22a03762dcfe60d632115ab5

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
