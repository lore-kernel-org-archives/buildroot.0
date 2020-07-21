From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Jul 2020 20:43:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnids: NVD database has been
 updated
In-Reply-To: <20200721180555.31453-1-guillaume.bressaix@gmail.com>
References: <20200721180555.31453-1-guillaume.bressaix@gmail.com>
Message-ID: <20200721204324.58fa9cc2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 Jul 2020 20:05:55 +0200
guillaume.bressaix at gmail.com wrote:

> From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
> 
> Thanks to Matthew W. & Thomas, the NVD database has been updated
> and CVE-2010-0751 is now declared fixed, see
> https://security-tracker.debian.org/tracker/CVE-2010-0751
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

Are you sure it has already been fixed ?

https://nvd.nist.gov/vuln/detail/CVE-2010-0751 still marks 1.24 as
affected as far as I can see.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
