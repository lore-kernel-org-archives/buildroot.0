From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 May 2019 18:20:28 +0200
Subject: [Buildroot] [PATCH v4 7/7] package/optee-benchmark: bump
 version to 3.5.0
In-Reply-To: <20190514085319.9031-7-etienne.carriere@linaro.org>
References: <20190514085319.9031-1-etienne.carriere@linaro.org>
 <20190514085319.9031-7-etienne.carriere@linaro.org>
Message-ID: <20190514182028.31092f6f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 May 2019 10:53:19 +0200
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> Bump OP-TEE Benchmark package version to release 3.5.0
> which now provides an identified LICENSE file.

But you did not add it to LICENSE_FILES, and the hash you added in
the .hash file for the LICENSE file was wrong. You really did not test
"make legal-info" it seems :-)

I fixed this and applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
