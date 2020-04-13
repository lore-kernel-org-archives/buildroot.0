From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 15:55:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/mongodb: disable on ARM 32 bits
In-Reply-To: <20190928073133.27537-1-fontaine.fabrice@gmail.com>
References: <20190928073133.27537-1-fontaine.fabrice@gmail.com>
Message-ID: <20200413155553.4b40c9d3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 28 Sep 2019 09:31:33 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> 32 bits architectures are not supported since version 3.4, see
> https://docs.mongodb.com/manual/installation/#supported-platforms
> 
> So update Config.in and drop patch which is not needed anymore
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

But does it fail to build, or run ? Why would we want to not support
ARM32, if it works? There must be a reason that lead you to send this
patch. What was this reason?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
