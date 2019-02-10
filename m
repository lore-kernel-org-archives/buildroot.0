From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Feb 2019 14:06:55 +0100
Subject: [Buildroot] [PATCH 9/12] package/mongodb: add boost mandatory
 dependency
In-Reply-To: <20190210114528.1753-9-fontaine.fabrice@gmail.com>
References: <20190210114528.1753-1-fontaine.fabrice@gmail.com>
 <20190210114528.1753-9-fontaine.fabrice@gmail.com>
Message-ID: <20190210140655.6b6ce932@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sun, 10 Feb 2019 12:45:25 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I don't understand PATCH 9/12, 10/12 and 11/12. If those are mandatory
dependencies, mongodb will not build after PATCH 8/12 is applied.

Could you make sure this patch series is bisectable ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
