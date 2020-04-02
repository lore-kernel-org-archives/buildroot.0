From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 2 Apr 2020 07:35:42 +0200
Subject: [Buildroot] [PATCH] package/qt5/qt5webengine: fix build error
In-Reply-To: <20200401170348.72cf210f@windsurf.home>
References: <20190730115832.21008-1-b.bilas@grinn-global.com>
 <20190730233029.7360e1bd@gmx.net>
 <ff0a929f-f321-7eb6-a9ea-91abd85bacf5@grinn-global.com>
 <20190811223051.707ac1a8@windsurf.home>
 <238c867c-5852-8295-d62e-ee6bf6812391@benettiengineering.com>
 <20200401170348.72cf210f@windsurf.home>
Message-ID: <20200402073542.0b82827a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Apr 2020 17:03:48 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> I am now trying to rebuild with gcc 7.5.0, since you said it was
> successful for you. If it is, then the issue was not gcc bug 83623.

For the record, gcc 7.5.0 indeed fixes the problem. So there must have
been a fix between gcc 7.4.0 and 7.5.0 that fixes the qt5webengine
build issue.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
