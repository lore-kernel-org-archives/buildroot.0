From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Jun 2017 16:19:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/popt: fix libiconv dependency
In-Reply-To: <20170527081952.24584-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 27 May 2017 10:19:52 +0200")
References: <20170527081952.24584-1-bernd.kuhls@t-online.de>
Message-ID: <877f0vlrja.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Make sure that libiconv is built before popt when needed.
 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
