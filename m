From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Mar 2019 11:01:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/clamav: security bump to
 version 0.101.2
In-Reply-To: <20190326220255.14363-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Tue, 26 Mar 2019 23:02:53 +0100")
References: <20190326220255.14363-1-bernd.kuhls@t-online.de>
Message-ID: <878swzmi6f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes:
 > https://blog.clamav.net/2019/03/clamav-01012-and-01003-patches-have.html

 > - Fixes for the following vulnerabilities affecting 0.101.1 and prior:
 >   - CVE-2019-1787:
 >     An out-of-bounds heap read condition may occur when scanning PDF
 >     documents. The defect is a failure to correctly keep track of the number
 >     of bytes remaining in a buffer when indexing file data.
 >   - CVE-2019-1789:
 >     An out-of-bounds heap read condition may occur when scanning PE files
 >     (i.e. Windows EXE and DLL files) that have been packed using Aspack as a
 >     result of inadequate bound-checking.
 >   - CVE-2019-1788:
 >     An out-of-bounds heap write condition may occur when scanning OLE2 files
 >     such as Microsoft Office 97-2003 documents. The invalid write happens when
 >     an invalid pointer is mistakenly used to initialize a 32bit integer to
 >     zero. This is likely to crash the application.

 > - Fixes for the following vulnerabilities affecting 0.101.1 and 0.101.0 only:
 >   - CVE-2019-1786:
 >     An out-of-bounds heap read condition may occur when scanning malformed PDF
 >     documents as a result of improper bounds-checking.
 >   - CVE-2019-1785:
 >     A path-traversal write condition may occur as a result of improper input
 >     validation when scanning RAR archives. Issue reported by aCaB.
 >   - CVE-2019-1798:
 >     A use-after-free condition may occur as a result of improper error
 >     handling when scanning nested RAR archives. Issue reported by David L.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2018.02.x, 2018.11.x and 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
