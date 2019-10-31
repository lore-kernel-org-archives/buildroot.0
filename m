From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 11:25:00 +0100
Subject: [Buildroot] [PATCH] package/file: add upstream security fix
In-Reply-To: <20191027074559.15727-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 27 Oct 2019 08:45:59 +0100")
References: <20191027074559.15727-1-peter@korsgaard.com>
Message-ID: <87r22txldv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerability:
 > - CVE-2019-18218: cdf_read_property_info in cdf.c in file through 5.37 does
 >   not restrict the number of CDF_VECTOR elements, which allows a heap-based
 >   buffer overflow (4-byte out-of-bounds write).

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
