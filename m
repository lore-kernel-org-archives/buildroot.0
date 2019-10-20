From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Oct 2019 15:59:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/python: security bump to
 version 2.7.17
In-Reply-To: <20191020081542.5711-3-asafka7@gmail.com>
References: <20191020081542.5711-1-asafka7@gmail.com>
 <20191020081542.5711-3-asafka7@gmail.com>
Message-ID: <20191020155911.6ae31215@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Oct 2019 11:15:41 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> This release fixes CVE-2019-9740, CVE-2019-9948, CVE-2019-15903.
> 
> Adjust 0002-Fix-get_python_inc-for-cross-compilation.patch for 2.7.17.
> 
> Remove the following patches (now on upstream):
> * 0035-bpo-35907-CVE-2019-9948-urllib-rejects-local_file-sc.patch
> * 0036-bpo-36216-Add-check-for-characters-in-netloc-that-no.patch
> * 0037-3.7-bpo-36216-Only-print-test-messages-when-verbose-.patch
> * 0038-bpo-36742-Fixes-handling-of-pre-normalization-charac.patch
> * 0039-bpo-36742-Corrects-fix-to-handle-decomposition-in-us.patch
> * 0040-2.7-bpo-36742-Fix-urlparse.urlsplit-error-message-fo.patch
> * 0041-bpo-30458-Disallow-control-chars-in-http-URLs-GH-127.patch
> 
> Full release details at:
> https://github.com/python/cpython/blob/v2.7.17/Misc/NEWS.d/2.7.17rc1.rst
> 
> run-tests results:
> 10:30:20 TestPython2                              Starting
> 10:30:21 TestPython2                              Building
> 10:37:37 TestPython2                              Building done
> 10:37:47 TestPython2                              Cleaning up
> .
> ----------------------------------------------------------------------
> Ran 1 test in 448.616s

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
