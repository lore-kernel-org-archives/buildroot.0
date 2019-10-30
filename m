From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Oct 2019 10:25:42 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/python: security
 bump to version 2.7.17
Message-ID: <20191030091858.E71E58DF07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39862bd5ca247522805cdf2926ca1298966fafcb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

This release fixes CVE-2019-9740, CVE-2019-9948, CVE-2019-15903.

Adjust 0002-Fix-get_python_inc-for-cross-compilation.patch for 2.7.17.

Remove the following patches (now on upstream):
* 0035-bpo-35907-CVE-2019-9948-urllib-rejects-local_file-sc.patch
* 0036-bpo-36216-Add-check-for-characters-in-netloc-that-no.patch
* 0037-3.7-bpo-36216-Only-print-test-messages-when-verbose-.patch
* 0038-bpo-36742-Fixes-handling-of-pre-normalization-charac.patch
* 0039-bpo-36742-Corrects-fix-to-handle-decomposition-in-us.patch
* 0040-2.7-bpo-36742-Fix-urlparse.urlsplit-error-message-fo.patch
* 0041-bpo-30458-Disallow-control-chars-in-http-URLs-GH-127.patch

Full release details at:
https://github.com/python/cpython/blob/v2.7.17/Misc/NEWS.d/2.7.17rc1.rst

run-tests results:
10:30:20 TestPython2                              Starting
10:30:21 TestPython2                              Building
10:37:37 TestPython2                              Building done
10:37:47 TestPython2                              Cleaning up
