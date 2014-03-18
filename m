From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
Date: Tue, 18 Mar 2014 07:39:09 -0300
Subject: [Buildroot] Patchwork cleanup #7: triaging proposal
In-Reply-To: <20140318055445.2aa965bb@skate>
References: <CAAXf6LWP0FX4AAGP_ACZHgoxEAEwarpEdHchukxE+V=WJnXROg@mail.gmail.com>
 <20140316160712.GA3267@free.fr>
 <CAAEAJfC-R-ieqWuNFaeD3BeYoeM1WogQVwpQVUyfLw9xtLv2iA@mail.gmail.com>
 <20140318055445.2aa965bb@skate>
Message-ID: <CAAEAJfCYpQLLRMSStaHmmO5x=QCB2pgyhnQqb=3PDQjx8_gFXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18 March 2014 01:54, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Sun, 16 Mar 2014 20:51:53 -0300, Ezequiel Garc?a wrote:
>
>> Quick context for directfb-lua.
>>
>> This is a little languange binding I created a few years ago when I was working
>> close to DirectFB. However, it's no longer the case, and I won't be
>> improving it.
>> Of course, I'm still here and I can try to maintain it.
>>
>> Probably it should be integrated into DirectFB itself, as a automated-test tool
>> or something, but that's something the DFB people should do.
>>
>> I thought about submitting the package to Buildroot, as otherwise it would fall
>> into oblivion. The tool itself is handy for anyone working on DFB; at
>> least to run
>> quick API tests.
>>
>> That said, I'm happy to provide a v2, addressing Fran?ois' feedback.
>> I just need to find some time to do it.
>
> If you don't use it, you don't really develop it anymore, and there
> isn't interest from other users, then maybe it isn't worth the effort
> to add this package in Buildroot?
>

I'm fine either way. As I said, I believe this should be integrated
into DFB's core,
rather than here. But since that won't seem to happen, I thought it would
be better to put it here and maybe "attract" some new users.
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
