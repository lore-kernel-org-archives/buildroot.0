From: Willy Lambert <lambert.willy@gmail.com>
Date: Thu, 17 Jan 2013 01:48:41 +0100
Subject: [Buildroot] Udev generates too many tty dev nodes
Message-ID: <CAKvQZ_2FEFO7BNqkzXTCeH5+scxg6ZhuW+Ruy99Q8xxivjhx_w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I'm trying to put my /dev folder into order, and I recently switched
from static config to udev. All device are correctly set up exept tty*
that are umerously present (something like 64 nodes).

_ Does anyone know if it is normal that so many files are generated ?
(or said differently should I wonder about my buildroot outputs)
_ Is there any mean to change that ?
_ Is this only and udev problem or is it linked to buildroot integration ?

I think it's a quite "common problem" but googling it didn't helped :(
The better answer was that :
http://unix.stackexchange.com/questions/25021/change-the-number-of-generated-dev-tty-devices
but it's a bit hackish... I generate a rootfs from scratch so I want
to manage everything that's happening inside, so in this case I want
to tell it how many device it may/should create.
