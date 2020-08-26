From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Aug 2020 12:36:16 +0200
Subject: [Buildroot] [PATCH 2/2] package/gnuradio: select LIBERATION
 fonts by default when GNURADIO_QTGUI is enabled
In-Reply-To: <20200826093028.870724-2-gwenj@trabucayre.com>
References: <20200826093028.870724-1-gwenj@trabucayre.com>
 <20200826093028.870724-2-gwenj@trabucayre.com>
Message-ID: <20200826123616.2418d4fd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 26 Aug 2020 11:30:28 +0200
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> qtgui option is used to display graph. All plot has legend and configuration options
> with text. Without font available no text is not displayed.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

I think it's a bit annoying to force a certain font. In fact most
Qt-based applications will want a font installed, so I'm not sure doing
some random font selection in each application package is really the
appropriate/scalable solution.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
