From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 May 2019 11:45:23 +0200
Subject: [Buildroot] [PATCH] package/libglib2: avoid printing null
 strings
In-Reply-To: <20190503142026.25724-1-grzegorz@blach.pl> (Grzegorz Blach's
 message of "Fri, 3 May 2019 14:20:26 +0000")
References: <20190503142026.25724-1-grzegorz@blach.pl>
Message-ID: <874l62skwc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grzegorz" == Grzegorz Blach <grzegorz@blach.pl> writes:

 > GCC 9 is being stricter about passing null string pointers
 > to printf-like functions.

 > Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
