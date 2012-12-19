From: Zoran Djordjevic <djdjdjole@yahoo.com>
Date: Wed, 19 Dec 2012 06:39:47 -0800 (PST)
Subject: [Buildroot] RFS for Raspberry Pi
In-Reply-To: <98ED3619EA864D3CBD8065366C586233@JohanW7>
References: <1355665119.20402.YahooMailNeo@web164606.mail.gq1.yahoo.com>
 <274D787D7C3C464E8B1A83F29C7109A3@JohanW7>
 <1355671875.21957.YahooMailNeo@web164604.mail.gq1.yahoo.com>
 <98ED3619EA864D3CBD8065366C586233@JohanW7>
Message-ID: <1355927987.67899.YahooMailNeo@web164601.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OK, thank's, I am going to try something in January and will inform if 
something interesting happend.
?
Regards
 

________________________________
 From: Sagaert Johan <sagaert.johan@skynet.be>
To: 'Zoran Djordjevic' <djdjdjole@yahoo.com> 
Sent: Wednesday, December 19, 2012 2:22 PM
Subject: RE: [Buildroot] RFS for Raspberry Pi
  

 
Hi Zoran 
? 
Sorry for the late response .. 
? 
I did 
not try it with another kernel, i am not sure but i assume it wil be apthed 
version to support the broadcom specific peripherals. 
? 
QT4.8 
is in the packages as well as the QT5rc? now. 
? 
I 
always use the internal toolchain for my projects. 
I did 
the raspberry build once for the fun of it...,no real plans with it for the 
moment... 
? 
Regards, Johan 
? 
 

________________________________
 Van: buildroot-bounces at busybox.net 
[mailto:buildroot-bounces at busybox.net] Namens Zoran 
Djordjevic
Verzonden: zondag 16 december 2012 16:31
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: 
[Buildroot] RFS for Raspberry Pi

  
Thank you Johan. At first 
glance, I think kernel is also included in this git. But I hope I am free, 
as 
I used?to, to?pull some other kernel ? Also, can I 
use makeconfig to build RFS with Crosstool-Ng 
and glibc (instead of uclibc), which suits me more ? Or what if I?prefer 
GTK or??Qt4? 
And one general question 
(already asked in previous mail) - can I simply use the same BuildRoot, that I 
installed when building RFS (not kernel)?for my mini2440, because I think 
it doesn't matter the board type ??  
? 
Regards Zoran 
 

________________________________
From: Sagaert Johan 
<sagaert.johan@skynet.be>
To: 'Zoran Djordjevic' 
<djdjdjole@yahoo.com> 
Sent: Sunday, December 16, 2012 3:13 
PM
Subject: RE: [Buildroot] RFS 
for Raspberry Pi


Hi Zoran 
? 
You need te pull this git::? 
git://github.com/nezticle/RaspberryPi-BuildRoot.git 
? 
https://github.com/nezticle/RaspberryPi-BuildRoot 
? 
It builds just fine and even contains 
QT5 
? 
Regards, Johan


________________________________
Van: buildroot-bounces at busybox.net 
[mailto:buildroot-bounces at busybox.net] Namens Zoran 
Djordjevic
Verzonden: zondag 16 december 2012 14:39
Aan: buildroot at busybox.net
Onderwerp: [Buildroot] RFS for Raspberry 
Pi

  
Recently I acquired new ARM based board -Raspberry Pi, and first I tried to 
inform myself about using Buildroot to build kernel and RFS, (u-boot ?). 
Earlier, I successfully built kernel and RFS for my mini2440 board, using 
Buildroot.?I found some discussion at: 
http://superuser.com/questions/473067/is-there-a-linux-distro-that-will-easily-run-embedded-style-on-a-raspberry-pi 
which states that Buidroot, yet has no?complete support for it.  
I thaught that Buildroot doesn't care about particular board, if I have 
kernel source for?it so?hope that?someone will?explain me 
that matter (and also what about Raspberry Pi). 

Regards
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121219/ee8291bd/attachment.html>
