From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 07:36:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/jasper: security bump version
 to 2.0.25
In-Reply-To: <20210215104528.22045-1-jubalh@iodoru.org> (Michael Vetter's
 message of "Mon, 15 Feb 2021 11:45:28 +0100")
References: <20210215104528.22045-1-jubalh@iodoru.org>
Message-ID: <87o8gj5hg1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Vetter <jubalh@iodoru.org> writes:

 > Changes:
 > * Fix memory-related bugs in the JPEG-2000 codec resulting from
 >   attempting to decode invalid code streams. (#264, #265)
 >   This fix is associated with CVE-2021-26926 and CVE-2021-26927.
 > * Fix wrong return value under some compilers (#260)
 > * Fix CVE-2021-3272 heap buffer overflow in jp2_decode (#259)

 > Signed-off-by: Michael Vetter <jubalh@iodoru.org>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
