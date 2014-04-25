From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Apr 2014 09:00:52 +0200
Subject: [Buildroot] yaffs2 file system
In-Reply-To: <CABzetm3tvU9bi5ZM__+sNSxVqtMrCDBfo0T5GhXYWagTtj7eBg@mail.gmail.com>
References: <CABzetm2LegsUVAH0a-3UYWNQcf2inSG4P8r5A6goGKNbJKsVVw@mail.gmail.com>
 <534CF34C.4050808@carallon.com> <20140420181528.6f4d2765@skate>
 <CABzetm3tvU9bi5ZM__+sNSxVqtMrCDBfo0T5GhXYWagTtj7eBg@mail.gmail.com>
Message-ID: <20140425090052.376e70a6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rohit Kumar,

On Fri, 25 Apr 2014 09:35:21 +0900, Rohit Kumar wrote:

> > I've taken your two patches, made a little bit of clean up, and I
> > applied them.
> >
> so how do we use it?

Well, pull the latest Buildroot, and in the "Filesystem images" menu,
you'll have a yaffs2 option. Simply enable it, and Buildroot will
generate a yaffs2 image of the root filesystem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
