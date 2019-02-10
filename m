From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 10 Feb 2019 08:14:43 +0100
Subject: [Buildroot] Buildroot-2.18.11 fails?
In-Reply-To: <e40ef8db-c9df-c6db-7e61-aac0f190712a@lamiaworks.com.au>
References: <e40ef8db-c9df-c6db-7e61-aac0f190712a@lamiaworks.com.au>
Message-ID: <20190210081443.348c14be@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello scsijon,

On Sun, 10 Feb 2019 15:20:45 +1100, scsijon <scsijon@lamiaworks.com.au> wrote:

> I thought i'd try it after so many years.
> I thought i'd try the last complete version before trying a snapshot.
> 
> So, what I did was to download and unpacked the 2018.11 package from 
> your site.

2018.11.2, 2018.11.1 or 2018.11?

> 
> Went into make menuconfig and changed (to match what I am use to working 
> with)>  
> target Architecture to x86_64;
> toolchain to glibc;
> gcc version to 8.x;
> linux kernel to 4.18 and added a defcon name;
> exited.
> 
> make source (to download the packages required so I could build offline);
> 
> make.
> 
> All went well until host-gcc-final-8.2.0 where it errored, failed and 
> exited.

Should not happen ;-), mind to share your .config/defconfig file?

Regards,
Peter

> 
> Before I consider proceeding further, could I have some help and advice 
> with this please. I would have thought this should have been ok.
> 
> I have attached the relevant section of the log file.
> 
> thanks
> scsijon
> 
> 
