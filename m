From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Mar 2015 23:22:18 +0100
Subject: [Buildroot] [PATCH v4 2/3] dtc: add patches for raspberry pi
 overlay support
In-Reply-To: <1421793790-32237-2-git-send-email-ps.report@gmx.net>
References: <1421793790-32237-1-git-send-email-ps.report@gmx.net>
 <1421793790-32237-2-git-send-email-ps.report@gmx.net>
Message-ID: <20150320222218.GC3979@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2015-01-20 23:43 +0100, Peter Seiderer spake thusly:
> See [1] for documentation of raspberry pi kernel dt overlay support.
> 
> The following patches (see original download urls) where adjusted to dtc-1.4.1:
[--SNIP--]

Unfortunately, those are feature patches (and not even trivial), and we
try hard not to bundle feature patches in Buildroot.

Please work with upstream dtc to have this upstreamed somehow.

When those are upstreamed, we can back-port them in Buildroot while
waiting for a new upstream version.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
