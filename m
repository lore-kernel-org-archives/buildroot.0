From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 15 Mar 2014 08:38:19 +0100
Subject: [Buildroot] [PATCH 2/2] fetchmail: New package
References: <1394835693-32232-1-git-send-email-berndkuhls@hotmail.com>
 <BLU0-SMTP1875387C9CEE20843356896D9700@phx.gbl>
 <20140314230014.GC16649@free.fr>
Message-ID: <bkcdvax9pm.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
news:20140314230014.GC16649 at free.fr: 

> and following the "download" link points to:
>     http://developer.berlios.de/project/showfiles.php?group_id=1824
> 
> which then has a download link for the tarball:
>     http://prdownload.berlios.de/fetchmail/fetchmail-6.3.26.tar.xz

Hi,

I decided deliberately not to use berlios.de as download location because 
they will close their project hosting next month:

http://developer.berlios.de/forum/forum.php?forum_id=39220

"The reorientation and associated closure of the highly frequented 
development platform for April, 30th 2014 makes it necessary to migrate the 
on berliOS hosted projects to other platforms."

Btw: There are two packages in buildroot currently using berlios.de as _SITE: 
perlcross & ngircd, and some more packages mention berlios.de in Config.in.

Regards, Bernd
