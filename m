From: Alexander Rigbo <alexander.rigbo@acgnystrom.se>
Date: Tue, 10 Apr 2007 07:23:17 +0200
Subject: [Buildroot] Kernel version's
In-Reply-To: <46195F39.2020108@teamboyce.co.uk>
References: <46195F39.2020108@teamboyce.co.uk>
Message-ID: <461B1F45.7000100@acgnystrom.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Rod Boyce wrote:
> All,
>
> I have testing out build root for my embedded Via project.  But I cannot 
> figure out why the system insists on downloading Linux kernel version 
> 2.6.11.5 when I have asked for 2.6.20.4?
>   
My guess would be that buildroot is still configured to use kernel 
headers version 2.6.11.5. Can you check this out?
> Regards,
> Rod Boyce
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
>   
Best Regards
Alexander
