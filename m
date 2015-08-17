From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Aug 2015 16:24:11 +0200
Subject: [Buildroot] [PATCH v3 1/1] rapidxml: new package
In-Reply-To: <20150817161659.54a1187c@free-electrons.com>
References: <1438749983-25600-1-git-send-email-yba@tkos.co.il>
 <20150817161659.54a1187c@free-electrons.com>
Message-ID: <20150817162411.21ee9259@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jonathan,

On Mon, 17 Aug 2015 16:16:59 +0200, Thomas Petazzoni wrote:

> >  package/Config.in              |    1 +
> >  package/rapidxml/Config.in     |   11 +++++++++++
> >  package/rapidxml/rapidxml.hash |    1 +
> >  package/rapidxml/rapidxml.mk   |   26 ++++++++++++++++++++++++++
> >  4 files changed, 39 insertions(+)
> >  create mode 100644 package/rapidxml/Config.in
> >  create mode 100644 package/rapidxml/rapidxml.hash
> >  create mode 100644 package/rapidxml/rapidxml.mk
> 
> Applied, after doing a number of changes:

For the record: the patch has been applied to the next branch, so it
will be part of the 2015.11 release, not the upcoming 2015.08 release.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
