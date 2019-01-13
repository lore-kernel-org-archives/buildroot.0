From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Jan 2019 21:48:14 +0100
Subject: [Buildroot] [PATCH v2,2/2] boost: bump to version 1.69.0
In-Reply-To: <20190113174316.26267-2-fontaine.fabrice@gmail.com>
References: <20190113174316.26267-1-fontaine.fabrice@gmail.com>
 <20190113174316.26267-2-fontaine.fabrice@gmail.com>
Message-ID: <20190113214814.280f3707@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 Jan 2019 18:43:16 +0100, Fabrice Fontaine wrote:
> - Remove fifth patch (already in version)
> - Remove BR2_PACKAGE_BOOST_SIGNALS as signals is now removed. Its
>   removal was announced in 1.68 and its deprecation was announced in
>   1.54. Users are encouraged to use Signals2 instead.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

The Config.in.legacy text did not pass check-package verification, the
lines were too long. I fixed that up, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
