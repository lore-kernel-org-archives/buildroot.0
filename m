From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 22:00:40 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/netsnmp: fix static build with openssl
In-Reply-To: <20190413085741.11342-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 13 Apr 2019 10:57:41 +0200")
References: <20190413085741.11342-1-fontaine.fabrice@gmail.com>
Message-ID: <8736m79nrr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Use pkg-config to find openssl dependencies such as lz or latomic
 > Fixes:
 >  - http://autobuild.buildroot.org/results/8f6fdbf8a21967363b737bc771252bcded4278a9

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Arnout Vandecappelle):
 >  - Drop patch and use pkg-config

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
