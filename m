From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 5 Oct 2018 18:09:11 +0200
Subject: [Buildroot] [PATCH v1 2/3] qt5serialbus: fix 5.6.3 license file
 hashes
In-Reply-To: <20181003144944.2a26cf25@windsurf>
References: <20181002211637.2356-1-ps.report@gmx.net>
 <20181002211637.2356-2-ps.report@gmx.net>
 <20181003045224.wlrhhkgyv2tj3pqg@sapphire.tkos.co.il>
 <20181003144944.2a26cf25@windsurf>
Message-ID: <20181005160911.GD2869@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-10-03 14:49 +0200, Thomas Petazzoni spake thusly:
> On Wed, 3 Oct 2018 07:52:24 +0300, Baruch Siach wrote:
> > Shouldn't the tarball hash move also here? Having the 5.6.x tarball hash in 
> > the default .hash file is confusing.
> 
> This doesn't work, because the download wrapper only uses the main hash
> file:
[--SNIP--]
> I discussed this topic on the mailing list a few weeks ago with Yann.
> See
> http://lists.busybox.net/pipermail/buildroot/2018-September/229892.html
> and
> http://lists.busybox.net/pipermail/buildroot/2018-September/230404.html.

I'm working on it. It is not straightforward.

I should have something clean enough to post later in the WE...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
