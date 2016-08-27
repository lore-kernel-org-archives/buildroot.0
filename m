From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Aug 2016 00:15:43 +0200
Subject: [Buildroot] [PATCH 10/16 v3] core: introduce per br2-external ID
In-Reply-To: <20160827221027.4fb4cc6c@free-electrons.com>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <a161d4b17c131b471418e4fa979aa73129ad102c.1468750623.git.yann.morin.1998@free.fr>
 <20160827221027.4fb4cc6c@free-electrons.com>
Message-ID: <20160827221543.GM5755@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-08-27 22:10 +0200, Thomas Petazzoni spake thusly:
> On Sun, 17 Jul 2016 12:34:30 +0200, Yann E. MORIN wrote:
> > This unique ID is used to construct a per br2-external tree variable,
> > BR2_EXTERNAL_$(ID), which contains the path to the br2-external tree.
> 
> I would suggest to use the terminology "name" rather than "ID". I
> think it's much easier to understand when using "name" that using "ID".
> It's a bit longer, but not much, and will make things clearer.

I'm OK with that. I will change.

Cordialement,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
