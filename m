From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Dec 2019 13:42:51 +0100
Subject: [Buildroot] [PATCH 1/3] package/jasper: Apply fix for
 CVE-2018-19541
In-Reply-To: <20191202115934.24216-1-jubalh@iodoru.org> (Michael Vetter's
 message of "Mon, 2 Dec 2019 12:59:32 +0100")
References: <20191202115934.24216-1-jubalh@iodoru.org>
Message-ID: <87fti2rj90.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Vetter <jubalh@iodoru.org> writes:

 > Add 0001-verify-data-range-CVE-2018-19541.patch:
 > We need to verify the data is in the expected range. Otherwise we get
 > problems later.

 > Patch was proposed upstream[1] but upstream is very inactive. Linux
 > distributions use the same fix to patch their packages.

 > 1: https://github.com/mdadams/jasper/pull/211
 > Signed-off-by: Michael Vetter <jubalh@iodoru.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
