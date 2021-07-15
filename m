From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Jul 2021 08:49:24 +0200
Subject: [Buildroot] [PATCH v2,
 2/2] package/thrift: security bump to version 0.14.1
In-Reply-To: <20210613091356.877947-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 13 Jun 2021 11:13:56 +0200")
References: <20210613091356.877947-1-fontaine.fabrice@gmail.com>
 <20210613091356.877947-2-fontaine.fabrice@gmail.com>
Message-ID: <874kcwul57.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2020-13949: In Apache Thrift 0.9.3 to 0.13.0, malicious RPC
 > clients could send short messages which would result in a large memory
 > allocation, potentially leading to denial of service.

 > - Disable javascript and nodejs which have been added with
 >   https://github.com/apache/thrift/commit/61d502075bf5da10331c201f604acdfefc4d5edc
 > - Update hash of LICENSE, license for windows-specific files added:
 >   https://github.com/apache/thrift/commit/98854c48744f20b3f551817273ed502835477f09

 > https://github.com/apache/thrift/blob/v0.14.1/CHANGES.md

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
