From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Apr 2019 09:02:51 +0200
Subject: [Buildroot] [RFC PATCH v1 1/6] package/go: implement go modules
 integration
In-Reply-To: <87mul1fe27.fsf@paral.in>
References: <20190317012142.10545-1-christian@paral.in>
 <20190407221726.130ca0fe@windsurf> <87mul1fe27.fsf@paral.in>
Message-ID: <20190408090251.7a63fd0d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,

Thanks a lot for your feedback!

On Sun, 07 Apr 2019 19:04:00 -0700
Christian Stewart <christian@paral.in> wrote:

> My suggestion is to instead solve the Go module stuff, and then bring in
> Glide-based packages with the glide.lock file converted into the Go
> module format via the above automatic process.

OK, thanks! What is the specific situation of the three Go packages
that Fabio wanted to integrate, namely bitcoin, btcd and neutrino ?
Will they be readily usable with the Go module integration ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
