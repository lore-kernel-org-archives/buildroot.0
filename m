From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Jul 2020 23:31:44 +0200
Subject: [Buildroot] [PATCH 2/2] package/nodejs: security bump to 12.18.0
In-Reply-To: <20200603193151.502850-2-martin@barkynet.com> (Martin Bark's
 message of "Wed, 3 Jun 2020 20:31:51 +0100")
References: <20200603193151.502850-1-martin@barkynet.com>
 <20200603193151.502850-2-martin@barkynet.com>
Message-ID: <87r1tgl8sf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:

 > This is a security release.
 > Vulnerabilities fixed:

 > CVE-2020-8172: TLS session reuse can lead to host certificate verification bypass (High).
 > CVE-2020-11080: HTTP/2 Large Settings Frame DoS (Low).
 > CVE-2020-8174: napi_get_value_string_*() allows various kinds of memory corruption (High).

 > See https://nodejs.org/en/blog/release/v12.18.0/

 > Signed-off-by: Martin Bark <martin@barkynet.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
