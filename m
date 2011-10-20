From: Michael S. Zick <minimod@morethan.org>
Date: Thu, 20 Oct 2011 07:56:01 -0500
Subject: [Buildroot] [PATCH v2] New package: parted
In-Reply-To: <CALB96N=4OwW95SoxHHusOBR9oQTuQ6uN_1swzkGqoF1q71YC0Q@mail.gmail.com>
References: <4E9FC67B.7030109@visionsystems.de>
 <CALB96N=4OwW95SoxHHusOBR9oQTuQ6uN_1swzkGqoF1q71YC0Q@mail.gmail.com>
Message-ID: <201110200756.04260.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu October 20 2011, Dechesne, Nicolas wrote:
> > +
> > +$(eval $(call AUTOTARGETS))
> > +
> >
> 
> why this instead of
> 
> $(eval $(call AUTOTARGETS,package,parted))
> 

The infra-structure has changed.

The documentation system is in the process of
being changed.

The visible documention has not yet caught up 
with all the changes.

Mike
