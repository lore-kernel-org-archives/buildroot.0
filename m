From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 10:50:28 +0200
Subject: [Buildroot] [PATCH v3] exiv2: new package
In-Reply-To: <p0rc0ex4pp.ln2@ID-313208.user.individual.net>
References: <1415357294-22601-1-git-send-email-nicolas.serafini@sensefly.com>
 <p0rc0ex4pp.ln2@ID-313208.user.individual.net>
Message-ID: <20170605105028.6c84fa4c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 04 Jun 2017 09:55:37 +0200, Bernd Kuhls wrote:

> > +EXIV2_INSTALL_STAGING = YES  
> 
> afaics no other buildroot package uses exiv2 so I would to remove the 
> staging install, any objections?

It is a library, so it makes sense to have it installed in staging.
There are plenty of other libraries that are not used by other packages
in Buildroot, but by people for their own custom/private applications.
Removing the staging installation for all those libraries would not
make sense.

So, I would say that we should keep the staging installation for exiv2.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
