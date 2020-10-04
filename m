From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Oct 2020 12:45:18 +0200
Subject: [Buildroot] [PATCH v2,
 2/2] package/vlc: fix build with live555 and without openssl
In-Reply-To: <20200713155135.1214109-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 13 Jul 2020 17:51:35 +0200")
References: <20200713155135.1214109-1-fontaine.fabrice@gmail.com>
 <20200713155135.1214109-2-fontaine.fabrice@gmail.com>
Message-ID: <871ries20x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Pass -DNO_OPENSSL to avoid a build failure with live555 but without
 > openssl

 > Fixes:
 >  - http://autobuild.buildroot.org/results/70ca93aa5c9488a4657c7bcafa40bfb2e974a5b3

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
