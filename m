From: Gururaja Hebbar K R <gururajakr@sanyo.co.in>
Date: Wed, 28 May 2008 06:14:50 +0530
Subject: [Buildroot] [PATCH] x11 xserver: Add xcalibrate proto,
	xcalibrate lib and xtscal app to xserver
References: <5BF78BCE8D9BF14A83F836BD9E3916BA0DDED8@blrms.slti.sanyo.co.in>
	<408540dd0805271509h27419f6an3cef5f4b9ddb625b@mail.gmail.com>
Message-ID: <5BF78BCE8D9BF14A83F836BD9E3916BA0DDEE5@blrms.slti.sanyo.co.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi,

While adding sources to xcalibrate package, i downloaded the package
from git, and tarballs from different directory. Really felt bad that i
hadn't changed it in the package make files.

For libXcalibrate & xcalibrate i used git to download latest file and
xtscal i downloaded from http://gpe.linuxtogo.org/download/source/

Kindly help me to add git commands to package make files. how to set
package make files to download files from git repository.

once i do this will send correct patches.  kindly place these patches on
hold till then

Regards
Gururaja

-----Original Message-----
From: Matthew Dombroski [mailto:matthew.dombroski at gmail.com] 
Sent: Tuesday, May 27, 2008 3:10 PM
To: Gururaja Hebbar K R
Subject: Re: [Buildroot] [PATCH] x11 xserver: Add xcalibrate proto,
xcalibrate lib and xtscal app to xserver

Hi,
This may seem to be a silly question but where do the source packages
come from?
libXcalibrate-0.1.0.tar.bz2
xcalibrate-0.1.0.tar.bz2
xtscal-0.6.3.tar.bz2

I can't find these in the xorg repository or anywhere else....

~Matt

> Below patch adds support for xcalibrate proto, xcalibrate lib and 
> xtscal app to xserver
