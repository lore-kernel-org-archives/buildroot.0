From: Woody Wu <narkewoody@gmail.com>
Date: Thu, 29 Nov 2012 08:51:42 +0000 (UTC)
Subject: [Buildroot] no /etc/hosts error in building root
References: <slrnkbdlmd.33p.narkewoody@zuhnb712.local.com>
 <20121129093344.0d4c46a0@skate>
Message-ID: <slrnkbe8f7.2kq.narkewoody@zuhnb712.local.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-11-29, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>
wrote:
> Dear Woody Wu,
>
> On Thu, 29 Nov 2012 03:31:16 +0000 (UTC), Woody Wu wrote:
>
>> I just removed the output/target directory and want to root filesystem
>> to be rebuilt by running 'make' again.  But this time I got an error:
>
> This is not supported. You can't remove output/target and expect
> Buildroot to reinstall everything.
>
> Best regards,
>
> Thomas

Yes, I understood.  After did that, I now already get a strange error
in building.  Now I had already delete everything from the disck and
trying to rebuild from scratch.

Thanks.


-- 
woody
I can't go back to yesterday - because I was a different person then.
