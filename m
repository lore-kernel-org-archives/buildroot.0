From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 17 Nov 2014 10:39:26 +0000
Subject: [Buildroot] [PATCH] package/sdl_sound: do not enable -Werror,
 even in debug mode
In-Reply-To: <20141116155731.GA10840@free.fr>
References: <1416152347-760-1-git-send-email-yann.morin.1998@free.fr>
 <XnsA3E7AB46367CBberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20141116155731.GA10840@free.fr>
Message-ID: <5469D05E.9090905@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/16/2014 03:57 PM, Yann E. MORIN wrote:
> Bernd, All,
> 
> On 2014-11-16 16:50 +0100, Bernd Kuhls spake thusly:
>> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
>> news:1416152347-760-1-git-send-email-yann.morin.1998 at free.fr:
>>
>>> Add a patch to remove -Werror from configure.in.
>>
>> a similar patch was rejected by Peter: 
>> http://patchwork.ozlabs.org/patch/400969/
> 
> Damned... :-(
> 
> Thanks for pointing out, I'll mark my patch Rejected in Patchwork (but
> will keep it locally, so I remember to fix this issue).
> 

It also was reported upstream, so, if you fix it, please consider
sending a patch to upstream as well:

http://lists.libsdl.org/pipermail/sdl-libsdl.org/2014-November/096804.html


-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
