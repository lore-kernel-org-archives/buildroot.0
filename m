From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Mon, 09 Nov 2015 09:43:56 +0100
Subject: [Buildroot] [PATCH 3/4] libfslparser: add install hooks to fix
	libraries path
In-Reply-To: <CAAMH-yvbFV0i_RfRu91apJRbz4TQ3DYCr8bB4ERKQ4afPtZ5zA@mail.gmail.com>
References: <1446149212-12048-1-git-send-email-gary.bisson@boundarydevices.com>
 <1924419.qtieCN8KUx@sagittea>
 <CAAMH-yvbFV0i_RfRu91apJRbz4TQ3DYCr8bB4ERKQ4afPtZ5zA@mail.gmail.com>
Message-ID: <3216905.pxiEsz4o6j@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 08 November 2015 17:08:43 Gary Bisson wrote:
> Hi J?r?me,
> 
> On Fri, Oct 30, 2015 at 11:43 AM, J?r?me Pouiller <jezz@sysmic.org> 
wrote:
> > On Friday 30 October 2015 11:36:21 Gary Bisson wrote:
[...]
> >> Although it might have been more consistent to have the staging
> >> hook
> >> in both, I chose to reduce the patch as much as possible. Plus I'm
> >> not sure people will like my symlink approach in the staging
> >> directory.> 
> > IMHO, target/ should be a subset of staging/ (even if today, this is
> > far from  the case). So, I would prefer to also create symlinks in
> > staging/.
> So I'm ok with adding the symlinks to the fslparser staging as well.
> But if we'd really like to have target as a subset of staging,
> shouldn't we use symlinks for the target too?

Sure, I am in favor to use symlinks for target/ also.


BR,

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
