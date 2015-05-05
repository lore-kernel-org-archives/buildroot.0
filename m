From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 5 May 2015 19:59:27 +0200
Subject: [Buildroot] [PATCH] package/at: needs uClibc or (e)glibc
In-Reply-To: <1430777435.4316.1.camel@embedded.rocks>
References: <1430776353-9627-1-git-send-email-yann.morin.1998@free.fr>
 <1430777435.4316.1.camel@embedded.rocks>
Message-ID: <20150505175927.GA4248@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg, All,

On 2015-05-05 00:10 +0200, J?rg Krause spake thusly:
> On Mo, 2015-05-04 at 23:52 +0200, Yann E. MORIN wrote:
> > at needs __isleap() which is (e)glibc and uClibc, but not in musl.
> > 
> 
> There is a patch on Open Embeddeds Patchwork for this issue:
> http://patchwork.openembedded.org/patch/91893/

I've just sent a v2 to use that patch. Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
