From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Feb 2021 20:29:58 +0100
Subject: [Buildroot] [PATCH] package/busybox: Fix check for IPv6 default
 route in udhcpc
In-Reply-To: <20210202015452.98002-1-sam@mendozajonas.com> (Samuel
 Mendoza-Jonas's message of "Mon, 1 Feb 2021 17:54:52 -0800")
References: <20210202015452.98002-1-sam@mendozajonas.com>
Message-ID: <87pn1heyq1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Mendoza-Jonas <sam@mendozajonas.com> writes:

 > The check for a default route is inverted, causing the script to wait
 > for the timeout even when a default IPv6 route is available. Fix this up
 > so that it exits early as expected.

 > Reported-by: Bhattiprolu RaviKumar <ravikumar.bhattiprolu@gmail.com>
 > Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
