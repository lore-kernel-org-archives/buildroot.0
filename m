From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 16:23:39 +0200
Subject: [Buildroot] [git commit] package/apr-util: add optional support
 for postgresql
In-Reply-To: <20180508132646.7ABB38B90E@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Tue, 8 May 2018 15:26:53 +0200")
References: <20180508132646.7ABB38B90E@busybox.osuosl.org>
Message-ID: <87y3g3yi38.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=1ec1479fbe520ec468ad7a00bda8311597cff8ea
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > apr-util contains optional support for postgresql:

 > $ ls -1 output/target/usr/lib/apr-util-1/apr_dbd_pg*
 > output/target/usr/lib/apr-util-1/apr_dbd_pgsql-1.so
 > output/target/usr/lib/apr-util-1/apr_dbd_pgsql.la
 > output/target/usr/lib/apr-util-1/apr_dbd_pgsql.so

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
