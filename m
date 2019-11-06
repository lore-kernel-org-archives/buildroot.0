From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 Nov 2019 22:47:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/lxc: switch optional gnutls
 dependency to openssl
In-Reply-To: <20191106155355.16943-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Wed, 6 Nov 2019 16:53:55 +0100")
References: <20191106155355.16943-1-bernd.kuhls@t-online.de>
Message-ID: <87eeykd6dt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > lxc switched from gnutls to openssl since version 3.2.0:
 > https://github.com/lxc/lxc/commit/fa2bb6ba532c5e7f92df8cbae50a68af519f9997

 > Patch was originally created by Fabrice Fontaine:
 > http://patchwork.ozlabs.org/patch/1148360/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
