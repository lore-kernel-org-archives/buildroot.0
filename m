From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Oct 2014 18:10:43 +0200
Subject: [Buildroot] [PATCH 1/6] python3: add distutils fix for PEP 3147
	issue
In-Reply-To: <20141001171404.78e112ee@grp-cvubrugier>
References: <1412113141-17650-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1412113141-17650-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20141001171404.78e112ee@grp-cvubrugier>
Message-ID: <20141001181043.617b1aaa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christophe Vu-Brugier,

On Wed, 1 Oct 2014 17:14:04 +0200, Christophe Vu-Brugier wrote:

> > +For the Python standard library, our Python 3 package already contains
> > +a patch named python3-004-old-stdlib-cache.patch, which allows to
> > +disable the PEP 3147 installation.
> > +
> > +But that lives the distutils/setuptools package an unsolved
>               ^
>             leaves?
> 
> Otherwise, looks good to me.
> 
> Reviewed-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>

Thanks for the review. Unless there are other comments, I'll leave to
the person who will commit the patch to make the change to the commit
log, since it's just a typo.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
