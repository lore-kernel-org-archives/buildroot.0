From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Dec 2018 17:10:56 +0100
Subject: [Buildroot] [PATCH] configs/nexbox_a95x: kernel needs
 host-openssl
In-Reply-To: <20181209143525.53fc6c6c@windsurf>
References: <20181209094146.26427-1-yann.morin.1998@free.fr>
 <20181209143525.53fc6c6c@windsurf>
Message-ID: <20181209161056.GD3383@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-12-09 14:35 +0100, Thomas Petazzoni spake thusly:
> Hello,
> 
> On Sun,  9 Dec 2018 10:41:46 +0100, Yann E. MORIN wrote:
> > Fixes: https://gitlab.com/ymorin/buildroot/-/jobs/131924236
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Peter Korsgaard <peter@korsgaard.com>
> 
> This defconfig didn't fail here:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/131217002
> 
> I'm curious to know you have different results. Both builds are using
> the exact same Docker image, so it's a bit confusing what is going on
> here.
> 
> Any idea ?

The build you pointed at is dated 2018-12-08, and later that day, Peter
changed that defconfig to use a newer kernel, see:
    9f5b07fc64 configs: nexbox_a95x_defconfig: bump to kernel 4.19.8

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
