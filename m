From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 2 Jan 2019 22:01:58 +0100
Subject: [Buildroot] [PATCH 1/1] glib-networking: depend on target
 ca-certificates.
In-Reply-To: <20190102205409.4f9d9ec6@windsurf>
References: <20190102165411.60822-1-aduskett@gmail.com>
 <20190102171704.GL23435@scaer> <20190102205409.4f9d9ec6@windsurf>
Message-ID: <20190102210158.GM23435@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-01-02 20:54 +0100, Thomas Petazzoni spake thusly:
> On Wed, 2 Jan 2019 18:17:04 +0100, Yann E. MORIN wrote:
> > Thomas: maybe we can look at updating it instead of trying to fix it?
> Is there a released/stable, non-development version of glib-networking
> that contains the commit fixing the issue ?

There's 2.58.0 which contains the change that no longer requires the
path to exist at build time.

Adam, are the versions tightly coupled between glib-networking and glib?
I.e, is it possible to use glib-networking-2.58.0 with glib-2.56.3, or
do we have to bump both simultaneously?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
