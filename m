From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Nov 2014 18:56:10 +0100
Subject: [Buildroot] [PATCH 1/1] iptables: fix userspace compilation of
 ip tables with C++
In-Reply-To: <CANQCQpbLK7xeaPy4TM1GZx_+ZZUTNYhXyce3Pqof3MSNLxtN1Q@mail.gmail.com>
References: <1413227563-5383-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20141029223413.70abc05b@free-electrons.com>
 <54516922.1070306@zacarias.com.ar>
 <CANQCQpbOzrKC+8oi3fkO7knQ_HafbpSbnusc6_STfwnSiU+2ZA@mail.gmail.com>
 <CANQCQpbLK7xeaPy4TM1GZx_+ZZUTNYhXyce3Pqof3MSNLxtN1Q@mail.gmail.com>
Message-ID: <20141118175610.GC4333@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matthew, All,

On 2014-11-18 07:48 -0600, Matthew Weber spake thusly:
[--SNIP--]
> I reposted on netfilter-devel and got clarification that the patch
> should probably have been a kernel patch, but the binary interface to
> iptables in the kernel has actually been replaced so this issue is
> deprecated.  I'll carry the patch in my build locally until we update
> our use of the API.

Well, the patch seems sensible. So maybe we could carry it in Buildroot?

> http://www.spinics.net/lists/netfilter-devel/msg33996.html

Still, there is a valid point in this reply: do we know of a FLOSS C++
package that uses the iptables binary interface?

If so, that would be interesting to see how they handle that situation.
And it would be a nice shoe to stick in the door so that patch can enter
the kernel.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
