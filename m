From: Martin Bark <martin@barkynet.com>
Date: Mon, 14 Dec 2015 20:24:30 +0000
Subject: [Buildroot] [PATCH 1/3] package/nodejs: Add version 5.2.0
In-Reply-To: <20151214210913.227563c9@free-electrons.com>
References: <1450122295-5311-1-git-send-email-martin@barkynet.com>
 <20151214210913.227563c9@free-electrons.com>
Message-ID: <CAFGQKxfvQwA3v8W=OKEvNR6SE06DTng6PxQGj4q7o4zUWYbU2g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

I'm not sure the answer to that.  What i can say is that all four are
getting maintained.  Also, according to https://github.com/nodejs/LTS
node.js 0.10.x will be maintained all the way until October 2016.

I see two logical approaches for buildroot:

1) Support all four in buildroot because node.js support all four
2) Only Support the 4.x and 5.x because they are the current LTS and
Stable releases (i.e. the ones on the front page of
https://nodejs.org)

Personally I'd vote for 2) because it simplifies things.

What are your thoughts?

Thanks

Martin


On 14 December 2015 at 20:09, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Martin,
>
> On Mon, 14 Dec 2015 19:44:53 +0000, Martin Bark wrote:
>> v5.2.0 is the current Stable release. See
>> https://nodejs.org/en/blog/release/v5.2.0 for details on the release.
>>
>> Signed-off-by: Martin Bark <martin@barkynet.com>
>
> So, we already have 0.10.x, 0.12.x, 4.2.x and now 5.2.x ?
>
> Is it possible to get rid of some older versions, rather than keeping
> all of them available ?
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
