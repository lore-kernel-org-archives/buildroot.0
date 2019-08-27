From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Aug 2019 23:22:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/openldap: security bump to
 version 2.4.48
In-Reply-To: <20190827105958.18918-1-stefan.sorensen@spectralink.com>
 (=?utf-8?Q?=22S=C3=B8rensen=2C?= Stefan"'s message of "Tue, 27 Aug 2019
 11:00:27 +0000")
References: <20190827105958.18918-1-stefan.sorensen@spectralink.com>
Message-ID: <87tva2i9qn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "S?rensen," == S?rensen, Stefan <Stefan.Sorensen@spectralink.com> writes:

 > Security fixes:
 > CVE-2019-13057: Fixed slapd to restrict rootDN proxyauthz to its own databases
 > CVE-2019-13565: Fixed slapd to initialize SASL SSF per connection

 > Full changelog:
 > https://www.openldap.org/lists/openldap-announce/201907/msg00001.html

 > Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>

Committed after fixing the sha256 line as pointed out by Bernd, thanks.

-- 
Bye, Peter Korsgaard
