From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Aug 2020 22:39:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/libcurl: bump to v7.72.0
In-Reply-To: <20200819125640.142469-1-titouan.christophe@railnova.eu> (Titouan
 Christophe's message of "Wed, 19 Aug 2020 14:56:40 +0200")
References: <20200819125640.142469-1-titouan.christophe@railnova.eu>
Message-ID: <87wo1pxfkr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

 > This new version fixes, amongst many other things, CVE-2020-8231
 > (https://curl.haxx.se/docs/CVE-2020-8231.html). See the full changelog
 > on https://curl.haxx.se/changes.html#7_72_0 .

 > Also drop the 4 patches, that have all been released upstream.

 > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>

Committed after adjusting subject to mark this as a security fix, thanks.

-- 
Bye, Peter Korsgaard
