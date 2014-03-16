From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
Date: Sun, 16 Mar 2014 20:51:53 -0300
Subject: [Buildroot] Patchwork cleanup #7: triaging proposal
In-Reply-To: <20140316160712.GA3267@free.fr>
References: <CAAXf6LWP0FX4AAGP_ACZHgoxEAEwarpEdHchukxE+V=WJnXROg@mail.gmail.com>
 <20140316160712.GA3267@free.fr>
Message-ID: <CAAEAJfC-R-ieqWuNFaeD3BeYoeM1WogQVwpQVUyfLw9xtLv2iA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16 March 2014 13:07, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>>
>> directfb-lua: new package
>> http://patchwork.ozlabs.org/patch/262971/
>
>     Vote: A, keep.
>

Quick context for directfb-lua.

This is a little languange binding I created a few years ago when I was working
close to DirectFB. However, it's no longer the case, and I won't be
improving it.
Of course, I'm still here and I can try to maintain it.

Probably it should be integrated into DirectFB itself, as a automated-test tool
or something, but that's something the DFB people should do.

I thought about submitting the package to Buildroot, as otherwise it would fall
into oblivion. The tool itself is handy for anyone working on DFB; at
least to run
quick API tests.

That said, I'm happy to provide a v2, addressing Fran?ois' feedback.
I just need to find some time to do it.

Regards,
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
