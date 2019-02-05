From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Feb 2019 13:45:37 +0100
Subject: [Buildroot] [PATCH v3 1/5] package/mender: adding a writable
 location
In-Reply-To: <1549363799-30840-2-git-send-email-angelo@amarulasolutions.com>
 (Angelo Compagnucci's message of "Tue, 5 Feb 2019 11:49:55 +0100")
References: <1549363799-30840-1-git-send-email-angelo@amarulasolutions.com>
 <1549363799-30840-2-git-send-email-angelo@amarulasolutions.com>
Message-ID: <875ztypfny.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:

 > Mender needs /var/lib/mender to be writable at the service start, the
 > path is hardcoded and thus we cannot change it.
 > This patch solves the problem using the same approach we have for
 > dropbear.

 > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Acked-by: <aduskett@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
