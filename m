From: Fatih =?utf-8?B?QcWfxLFjxLE=?= <fatih.asici@gmail.com>
Date: Sun, 20 Jul 2014 14:20:02 +0300
Subject: [Buildroot] [PATCH 1/6] qt5multimedia: make qt5declarative
	dependency optional
In-Reply-To: <20140720120234.14bfc9fe@free-electrons.com>
References: <1405791208-30356-1-git-send-email-fatih.asici@gmail.com>
 <1405791208-30356-2-git-send-email-fatih.asici@gmail.com>
 <20140720120234.14bfc9fe@free-electrons.com>
Message-ID: <4148692.gXTWrTV3UG@asici>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 20 July 2014 12:02:34 Thomas Petazzoni wrote:
> Dear Fatih A??c?,
> 
> On Sat, 19 Jul 2014 20:33:23 +0300, Fatih A??c? wrote:
> > Also add missing dependencies on gui and network modules.
> > 
> > Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
> > ---
> > 
> >  package/qt5/qt5multimedia/Config.in        | 10 ++--------
> >  package/qt5/qt5multimedia/qt5multimedia.mk |  6 +++++-
> >  2 files changed, 7 insertions(+), 9 deletions(-)
> 
> Applied, thanks. However, please do not send your patches to both
> buildroot at uclibc.org and buildroot at buildroot.org: they are the same
> mailing list, so your patches appear twice on the list.

Sorry. I passed one mail address from the command line; but I have realized that 
.git/config file also has another address. I had added the latter for convenience 
but forgot it.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140720/97856241/attachment.html>
