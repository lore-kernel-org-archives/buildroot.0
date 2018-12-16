From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 22:10:18 +0100
Subject: [Buildroot] [PATCH] nodejs: security bump to version 8.14.0
In-Reply-To: <20181209221830.13407-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 9 Dec 2018 23:18:30 +0100")
References: <20181209221830.13407-1-peter@korsgaard.com>
Message-ID: <87ftux6uv9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerabilities:
 > - Node.js: Denial of Service with large HTTP headers (CVE-2018-12121)
 > - Node.js: Slowloris HTTP Denial of Service (CVE-2018-12122 / Node.js)
 > - Node.js: Hostname spoofing in URL parser for javascript protocol
 >   (CVE-2018-12123)
 > - Node.js: HTTP request splitting (CVE-2018-12116)
 > - OpenSSL: Timing vulnerability in DSA signature generation (CVE-2018-0734)
 > - OpenSSL: Microarchitecture timing vulnerability in ECC scalar
 >   multiplication (CVE-2018-5407)

 > For more details, see the announcement:
 > https://nodejs.org/en/blog/release/v8.14.0/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, 2018.08.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
