From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Sat, 8 Mar 2014 00:03:32 +0100
Subject: [Buildroot] [PATCH] bluez5_utils: new package
In-Reply-To: <20140307235611.7558047d@skate>
References: <1387791444-28056-1-git-send-email-alexandre.belloni@free-electrons.com>
 <20140307235611.7558047d@skate>
Message-ID: <20140307230331.GC2918@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 07/03/2014 at 23:56:11 +0100, Thomas Petazzoni wrote :
> Dear Alexandre Belloni,
> 
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
> Can you resend an updated version of this patch, that takes into
> account the review comments you have received? It would be great to
> have bluez5_utils in Buildroot.
> 

It may make sense to take the patch from Marcin as it is almost the same
as mine Yann had a few comments on it this week:

http://lists.busybox.net/pipermail/buildroot/2014-March/091454.html

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
