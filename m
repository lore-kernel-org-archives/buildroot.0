From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Dec 2013 10:57:25 +0100
Subject: [Buildroot] [PATCH] bluez5_utils: new package
In-Reply-To: <20131223105059.26698156@skate>
References: <1387791444-28056-1-git-send-email-alexandre.belloni@free-electrons.com>
 <20131223105059.26698156@skate>
Message-ID: <20131223105725.61e07a0b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 Dec 2013 10:50:59 +0100, Thomas Petazzoni wrote:

> On Mon, 23 Dec 2013 10:37:24 +0100, Alexandre Belloni wrote:
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> > ---
> >  package/Config.in                                  |   1 +
> >  package/bluez5_utils/Config.in                     |  16 ++++
> >  .../bluez5_utils-5.12-enable_cg2900.patch          | 106 +++++++++++++++++++++
> >  package/bluez5_utils/bluez5_utils.mk               |  31 ++++++
> >  package/bluez_utils/Config.in                      |   8 +-
> >  5 files changed, 161 insertions(+), 1 deletion(-)
> >  create mode 100644 package/bluez5_utils/Config.in
> >  create mode 100644 package/bluez5_utils/bluez5_utils-5.12-enable_cg2900.patch
> >  create mode 100644 package/bluez5_utils/bluez5_utils.mk
> 
> When you send a new version of a patch, please change the subject
> prefix to add "PATCH v2", and also include a changelog in your patch so
> that we know what changed between v1 and v2.

My bad. The previous version of this patch was not sent by you, but by
Marcin Bis, so your version is not really a v2.

Have you looked at Marcin Bis version to see if your version includes
all of what Marcin did, if applicable?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
