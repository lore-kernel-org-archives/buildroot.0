From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 20:58:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/libupnp: security bump to
 version 1.14.6
In-Reply-To: <20210422072922.63604-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Thu, 22 Apr 2021 07:29:22 +0000")
References: <20210422072922.63604-1-joerg.krause@embedded.rocks>
Message-ID: <874kfsj2jb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > The server part of pupnp (libupnp) appears to be vulnerable to DNS-rebinding
 > attacks because it does not check the value of the `Host` header.

 > Fixes CVE-2021-29462

 > https://github.com/pupnp/pupnp/security/advisories/GHSA-6hqq-w3jq-9fhg

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
