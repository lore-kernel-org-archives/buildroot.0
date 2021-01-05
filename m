From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Jan 2021 23:28:37 +0100
Subject: [Buildroot] [PATCH] package/nfs-utils: select
 BR2_PACKAGE_RPCBIND only if needed
In-Reply-To: <20201116114033.844188-1-angelo@amarulasolutions.com> (Angelo
 Compagnucci's message of "Mon, 16 Nov 2020 12:40:33 +0100")
References: <20201116114033.844188-1-angelo@amarulasolutions.com>
Message-ID: <87pn2j3tnu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:

 > rpcbind is only used by nfsd to export nfs share supporting older
 > v2, v3 protocols.

 > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
