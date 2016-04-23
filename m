From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Apr 2016 19:19:17 +0200
Subject: [Buildroot] [PATCH 1/1] Preliminary support for Raspberry Pi 3.
In-Reply-To: <571baa9a.a6dec20a.5b3db.ffffd33eSMTPIN_ADDED_MISSING@mx.google.com>
 (ubaldo porcheddu's message of "Sat, 23 Apr 2016 18:02:09 +0100")
References: <571baa9a.a6dec20a.5b3db.ffffd33eSMTPIN_ADDED_MISSING@mx.google.com>
Message-ID: <87inz8qm3u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ubaldo" == ubaldo porcheddu <ubaldo@eja.it> writes:

Hi

 >> Thanks. Aren't these basically identical to the rpi1/rpi2 variants 
 >> (except for the genimage script)? Please rework it to simply add a 
 >> raspberrypi3 symlink like we do for raspberrypi2. 
 >> 

 > that is what I basically did with my previous patch but I understood
 > from your answer that you would prefer to write a dedicated
 > raspberrypi3 directory as a future separated base for 64bit version, I
 > would try submitting a new one later today as a symlink.

I would like to have a seperate defconfig, but it should reuse as much
as possible from the other variants (E.G. similar to how the rpi2
defconfig reuses board/raspberrypi/*).

-- 
Venlig hilsen,
Peter Korsgaard 
