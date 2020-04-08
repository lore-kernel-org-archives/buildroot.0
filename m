From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 08 Apr 2020 17:21:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/thrift: security bump to v0.13
In-Reply-To: <20200408095055.26514-1-titouan.christophe@railnova.eu> (Titouan
 Christophe's message of "Wed, 8 Apr 2020 11:50:55 +0200")
References: <20200408095055.26514-1-titouan.christophe@railnova.eu>
Message-ID: <87zhbmgg0m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

 > Drop patch because the linker error no longer appears on br-x86-64-musl.
 > v0.13.0 fixes the following CVEs:

 > CVE-2019-0205: In Apache Thrift all versions up to and including 0.12.0,
 > a server or client may run into an endless loop when feed with specific
 > input data. Because the issue had already been partially fixed in version
 > 0.11.0, depending on the installed version it affects only certain
 > language bindings.

 > CVE-2019-0210: In Apache Thrift 0.9.3 to 0.12.0, a server implemented
 > in Go using TJSONProtocol or TSimpleJSONProtocol may panic when feed with
 > invalid input data.

 > Also update the hash file to the new two-spaces convention

 > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>

Committed, thanks.

-- 
Bye, Peter Korsgaard
