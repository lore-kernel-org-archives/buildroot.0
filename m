From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Dec 2019 20:05:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/tiff: security bump to 4.1.0
In-Reply-To: <20191129101238.9492-1-jubalh@iodoru.org> (Michael Vetter's
 message of "Fri, 29 Nov 2019 11:12:38 +0100")
References: <20191129101238.9492-1-jubalh@iodoru.org>
Message-ID: <87eexir3td.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Vetter <jubalh@iodoru.org> writes:

 > Fixes the following security vulnerabilities:
 >   * CVE-2018-12900
 >   * CVE-2018-17000
 >   * CVE-2019-6128
 >   * CVE-2019-7663
 >   * CVE-2019-14973
 >   * CVE-2018-19210

 > Remove because contained upstream:
 > 0001-Fix-for-simple-memory-leak-that-was-assigned-CVE-2019-6128.patch

 > Signed-off-by: Michael Vetter <jubalh@iodoru.org>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
