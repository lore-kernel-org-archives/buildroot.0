From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 Oct 2015 21:25:46 +0200
Subject: [Buildroot] [v4 1/4] package/nodejs: Add node.js v0.12.5 and
 set as the default version
In-Reply-To: <1435830207-16664-1-git-send-email-martin@barkynet.com>
References: <1435830207-16664-1-git-send-email-martin@barkynet.com>
Message-ID: <20151011192546.GA24916@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2015-07-02 10:43 +0100, Martin Bark spake thusly:
> The version of the V8 JavaScript engine used by node.js v0.12.5 requires
> at least an ARMv6 architecture with VFPv2.

I'm trying to bump to node.js 4.1.2 and was wondering if that limitation
still exists in that version.

I was able to sucessfully build for an arm926t (armv5) with a VFPv2 FPU.

So:
  - is the failure a runtime failure or a build time one?
  - is armv6 really required, or can we just require VFPv2?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
