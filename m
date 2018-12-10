From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Dec 2018 11:48:08 +0100
Subject: [Buildroot] [PATCH] nodejs: security bump to version 8.14.0
In-Reply-To: <20181209221830.13407-1-peter@korsgaard.com>
References: <20181209221830.13407-1-peter@korsgaard.com>
Message-ID: <20181210114808.466b3b05@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Dec 2018 23:18:30 +0100, Peter Korsgaard wrote:
> Fixes the following security vulnerabilities:
> 
> - Node.js: Denial of Service with large HTTP headers (CVE-2018-12121)
> - Node.js: Slowloris HTTP Denial of Service (CVE-2018-12122 / Node.js)
> - Node.js: Hostname spoofing in URL parser for javascript protocol
>   (CVE-2018-12123)
> - Node.js: HTTP request splitting (CVE-2018-12116)
> - OpenSSL: Timing vulnerability in DSA signature generation (CVE-2018-0734)
> - OpenSSL: Microarchitecture timing vulnerability in ECC scalar
>   multiplication (CVE-2018-5407)
> 
> For more details, see the announcement:
> https://nodejs.org/en/blog/release/v8.14.0/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/nodejs/nodejs.hash | 4 ++--
>  package/nodejs/nodejs.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
