From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Dec 2019 08:28:30 +0100
Subject: [Buildroot] [PATCH] package/libuio: add missing dependency on
 host-pkgconf
In-Reply-To: <20191210221022.948846-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 10 Dec 2019 23:10:22 +0100")
References: <20191210221022.948846-1-thomas.petazzoni@bootlin.com>
Message-ID: <87o8wehujl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > configure fails if the pkgconfig.m4 macros are not available during
 > this package autoreconf:

 > ./configure: line 12003: syntax error near unexpected token `PKGCONF,'
 > ./configure: line 12003: `   PKG_CHECK_MODULES(PKGCONF, glib-2.0)

 > Fixes:

 >   http://autobuild.buildroot.net/results/9be944e35090bf270fbc9572423466be9af7b1f2/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
