From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Sep 2013 20:55:14 +0200
Subject: [Buildroot] [PATCH 1/5] qt5: bump to 5.1.1
In-Reply-To: <523B3759.1000901@mind.be>
References: <201309182118.23091.fatih.asici@gmail.com>
 <20130919062450.10f51848@skate> <1379568660.27759.4.camel@viko>
 <523B3759.1000901@mind.be>
Message-ID: <20130919205514.53b092ff@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 19 Sep 2013 19:41:45 +0200, Arnout Vandecappelle wrote:

>   Perhaps we could try upstreaming our mkspecs? Does that make sense?

Our mkspecs is really meant to be a template that has to be tuned by
the qt5base.mk makefile, and therefore outside Buildroot itself I
believe its meaning is not so important. We could even carry it within
package/qt5/qt5base/ rather than as a patch, for example.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
