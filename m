From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Sep 2020 22:54:28 +0200
Subject: [Buildroot] More maintainers
In-Reply-To: <20200905202557.GZ14354@scaer>
References: <CAJX3zAuYgzv6_d2Fb8wUrHwPnyg0FEmNSfkiJkQ=zyqEqXKcrA@mail.gmail.com>
 <20200903182409.6b337059@windsurf.home>
 <CA+TH9V=Czc80jT1jExNC+XUrqHz5mz+oFNvORcfjotCVXrO0KQ@mail.gmail.com>
 <87o8mlmoga.fsf@dell.be.48ers.dk>
 <CA+TH9VkA2ETrCvQF+mhb=PeKm8P=o2Jnesmooh4KCKSbzUcANQ@mail.gmail.com>
 <87blilmeo2.fsf@dell.be.48ers.dk>
 <CA+h8R2qYVjSwFZR0DcOpAdSY8nZKURLwW+a8tanxpEvDh__fSg@mail.gmail.com>
 <877dt8n2o7.fsf@dell.be.48ers.dk>
 <CAFSsvmqdBURoCVmbFRBUoYwd3VErpOp1GcG=xzxJETpbpAVrTg@mail.gmail.com>
 <20200905202557.GZ14354@scaer>
Message-ID: <20200905205428.GB14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-09-05 22:25 +0200, Yann E. MORIN spake thusly:
> On 2020-09-05 09:20 -0700, Adam Duskett spake thusly:
> > Here's a simple test:
> > https://patchwork.ozlabs.org/project/buildroot/patch/20191112162325.529637-2-m.niestroj at grinn-global.com/

So, I have now had a look at that pending patch.

I tried to apply it to master, but it failed: there is a conflict.

And indeed, we've had that test since 2020-03-24, with commit 803fc6ad51
(support/testing: add netdata test).

The patch still pending is v3 of the patchset, while there has been a
v4, a v5, and eventually a v6, which was applied.

Thus the pending patch is just some missed-to-be-updated patch in
patchwork; I've now marked it as superseded.

Thanks, I like it when the backlog decreases. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
