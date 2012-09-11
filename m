From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Sep 2012 16:45:45 +0200
Subject: [Buildroot] [PATCH 2/4] Make Berkeley DB a dependency of
 linux-pam and make sure it is selected
In-Reply-To: <CADiAo4Jn3mdhvTOvDUria1XBnLvOCO_pAMWScdtTZhS67P4oxw@mail.gmail.com>
References: <1347078066-25257-1-git-send-email-golubovsky@gmail.com>
 <1347078066-25257-2-git-send-email-golubovsky@gmail.com>
 <20120911163255.07c42a02@skate>
 <CADiAo4Jn3mdhvTOvDUria1XBnLvOCO_pAMWScdtTZhS67P4oxw@mail.gmail.com>
Message-ID: <20120911164545.6a41f36c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 11 Sep 2012 10:44:03 -0400,
Dmitry Golubovsky <golubovsky@gmail.com> a ?crit :

> > Looking at the code, the dependency indeed looks necessary. But isn't
> > it possible to rework a bit linux-pam to make this dependency optional
> > (and then submit this upstream)? Of course, if you don't care about
> > making this dependency optional, then just keep it as it is.
> 
> I don't think such change in linux-pam is really needed. I'd keep it
> here given the fix is trivial, and BerkeleyDB is not a huge library.

Ok, fine with me.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
