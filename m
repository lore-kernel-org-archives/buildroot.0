From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 12 Jul 2016 17:05:17 +0000 (UTC)
Subject: [Buildroot] Buildroot now requires IPv6?
References: <nm0hoh$8ce$1@ger.gmane.org> <20160711164358.GT3870@tarshish>
 <20160712164820.GC3680@free.fr>
Message-ID: <nm380d$ipv$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2016-07-12, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
>> Only uClibc is mentioned here because other C libraries already enable IPv6 
>> unconditionally.
>
> But nothing prevents you from running on a kernel that does not have
> IPv6.

Cool. That's what I was planning on doing, but I hadn't tried it yet.

> The requirements are only about IPv6 support in the toolchain.

> Maintaining support for non-IPv6 toolchains was becoming quite a
> problem, as more and more packages were breaking with such toolchains.

That's understandable.

> And come on, we're in 2016, there is no more IPv4 available, it's time
> to switch over to IPV6! ;-]

The devices I use buildroot for are never connected to the Internet.
Most of the time they're on an air-gapped network with at most a dozen
or two nodes -- so IPv4 works fine.

Although using IPv6 with link-local addresses and auto-discovery would
be even better, these customer are just barely getting the hang of
Ethernet and IPv4...

-- 
Grant Edwards               grant.b.edwards        Yow! My CODE of ETHICS
                                  at               is vacationing at famed
                              gmail.com            SCHROON LAKE in upstate
                                                   New York!!
