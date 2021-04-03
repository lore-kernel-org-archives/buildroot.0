From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Apr 2021 15:35:44 +0200
Subject: [Buildroot] 
 =?utf-8?b?5Zue5aSN77yaIFJlOiAgcGFja2FnZTogYWRkIGtt?=
 =?utf-8?q?scon?=
In-Reply-To: <1GPg4h1y5xBmcMZ8x0COgHaYlDvdbAAaYawHMnsJXWvW4rLTnPX_Z_i8dPMXiGcW3foDWIR0WHEXswAn-Dug5KGFGbGpYZJes-FQke6mgHY=@protonmail.com>
References: <XQTayAXJ0ouEvKU_bcf0tyt6DOSr7_rf8dmmfl2a69DXbglRV1NCkl0buP5dG9ag5D1-UeOQFi6XBAyQSmPFOUu6W3nrggufcZqjkctXEbM=@protonmail.com>
 <20210403141807.69534733@windsurf.home>
 <1GPg4h1y5xBmcMZ8x0COgHaYlDvdbAAaYawHMnsJXWvW4rLTnPX_Z_i8dPMXiGcW3foDWIR0WHEXswAn-Dug5KGFGbGpYZJes-FQke6mgHY=@protonmail.com>
Message-ID: <20210403133544.GX24043@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 2021-04-03 13:22 +0000, qblade via buildroot spake thusly:
> The sad thing is that I am using a free email service, which does not
> provide smtp service for free users. I can only send emails through
> the web version. Is there really no other way to send patches?

You could try sending one patch per email:

 1. Be sure your commit are complete: titile, commit log, authorship and
    your Signed-off-by line, see:
        https://buildroot.org/downloads/manual/manual.html#submitting-patches

 2. prepare your patches with git format-patch

 3. send the first patch as attachment to the first mail, then the
    second patch as attachment to the second mail; make the mail subject
    (and body?) duplicate the commit title and commit log.

If all goes well, your patches should popup after a little while on the
list of pending ptches:
    https://patchwork.ozlabs.org/project/buildroot/list/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
