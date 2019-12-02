From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Dec 2019 13:42:56 +0100
Subject: [Buildroot] [PATCH 2/3] package/jasper: Apply fix for
 CVE-2018-19542
In-Reply-To: <20191202115934.24216-2-jubalh@iodoru.org> (Michael Vetter's
 message of "Mon, 2 Dec 2019 12:59:33 +0100")
References: <20191202115934.24216-1-jubalh@iodoru.org>
 <20191202115934.24216-2-jubalh@iodoru.org>
Message-ID: <87blsqrj8v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Vetter <jubalh@iodoru.org> writes:

 > Add 0002-check-null-in-jp2_decode.patch:
 > Patch was proposed upstream[1] but upstream is very inactive.
 > Linux distributions use the same fix to patch their packages.

 > 1: https://github.com/mdadams/jasper/pull/200
 > Signed-off-by: Michael Vetter <jubalh@iodoru.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
