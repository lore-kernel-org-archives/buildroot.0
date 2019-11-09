From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Nov 2019 15:19:28 +0100
Subject: [Buildroot] [PATCH 2/2] configs/beaglebone: use the new
 BeagleBoard/BeagleBone kernel repository
In-Reply-To: <CAJ4jsaeuA66DLtkH8dLpJQpimSwjd5w5ntOZh2+9o7O1zvGOTQ@mail.gmail.com>
References: <20191102223839.16262-1-unixmania@gmail.com>
 <20191102223839.16262-3-unixmania@gmail.com>
 <20191108221256.089bfa50@windsurf>
 <CAJ4jsaeuA66DLtkH8dLpJQpimSwjd5w5ntOZh2+9o7O1zvGOTQ@mail.gmail.com>
Message-ID: <20191109151928.19e4b11e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 8 Nov 2019 20:11:14 -0300
Carlos Santos <unixmania@gmail.com> wrote:

> > I've applied to next... but after doing, I realized that you could have
> > used the github macro, like we do in beagleboneai_defconfig. Could you
> > send a patch for that ?  
> 
> I kept using git download method but I can replace it by the download
> or the tarbal from GitHub.

Yes, it's nicer to use the github macro, it saves a lot of download time.

> > Also, it would be nice if we could align beagleboneai, beaglebone and
> > beaglebone_qt5 to use the same U-Boot/Linux versions, if possible. I
> > see that the beagleboneai is using 4.14 even though it's a much newer
> > platform than beaglebone.  
> 
> I have been working on it but did not have much free time in the last
> weeks. I will try to fix it on time for 2019.11.

Sure, no problem. That was really a "nice to have" comment. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
