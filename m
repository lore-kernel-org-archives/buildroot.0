From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Dec 2019 13:43:04 +0100
Subject: [Buildroot] [PATCH 3/3] package/jasper: Apply fix for
 CVE-2018-19540
In-Reply-To: <20191202115934.24216-3-jubalh@iodoru.org> (Michael Vetter's
 message of "Mon, 2 Dec 2019 12:59:34 +0100")
References: <20191202115934.24216-1-jubalh@iodoru.org>
 <20191202115934.24216-3-jubalh@iodoru.org>
Message-ID: <877e3erj8n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Vetter <jubalh@iodoru.org> writes:

 > Add 0003-test-asclen-CVE-2018-19540.patch:
 > If txtdesc->asclen is < 1, the array index of
 > txtdesc-> ascdata will be negative which causes the heap based overflow.

 > Patch was proposed upstream[1] but upstream is very inactive. Linux
 > distributions use the same fix to patch their packages.

 > 1: https://github.com/mdadams/jasper/pull/198
 > Signed-off-by: Michael Vetter <jubalh@iodoru.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
