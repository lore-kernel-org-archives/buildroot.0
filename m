From: Julian Lunz <git@jlunz.de>
Date: Tue, 5 Jun 2012 23:25:05 +0200
Subject: [Buildroot] [PATCH] freerdp: new package Signed-off-by: Julian
 Lunz <git@jlunz.de>
In-Reply-To: <20120605222402.5bb8b156@skate>
References: <1338825460-6596-1-git-send-email-git@jlunz.de>
 <20120605222402.5bb8b156@skate>
Message-ID: <20120605232505.25317a1e@jl-desk-LL>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Tue, 5 Jun 2012 22:24:02 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> Le Mon,  4 Jun 2012 17:57:40 +0200,
> Julian Lunz <git@jlunz.de> a ?crit :
> 
> > ---
> >  package/Config.in          |    1 +
> >  package/freerdp/Config.in  |   13 +++++++++++++
> >  package/freerdp/freerdp.mk |   41
> > +++++++++++++++++++++++++++++++++++++++++ 3 files changed, 55
> > insertions(+), 0 deletions(-)
> 
> Thanks, it looks much better. One additional issue: you must put your
> Signed-off-by line after one blank line after the commit title, i.e:
> 
> """
> freerdp: new package
> 
> Signed-off-by: ....
> """
> 
> Otherwise, git believes that your Signed-off-by is part of the commit
> title, which is not nice.
> 
> Thomas

Hi,

sorry, now fixed:
[PATCH v2] freerdp: new package
Date: Tue,  5 Jun 2012 23:19:53 +0200

Regards,
Julian
