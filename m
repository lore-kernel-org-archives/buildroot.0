From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Dec 2015 21:43:37 +0100
Subject: [Buildroot] [PATCH 1/3] package/nodejs: Add version 5.2.0
In-Reply-To: <CAFGQKxfvQwA3v8W=OKEvNR6SE06DTng6PxQGj4q7o4zUWYbU2g@mail.gmail.com>
References: <1450122295-5311-1-git-send-email-martin@barkynet.com>
 <20151214210913.227563c9@free-electrons.com>
 <CAFGQKxfvQwA3v8W=OKEvNR6SE06DTng6PxQGj4q7o4zUWYbU2g@mail.gmail.com>
Message-ID: <20151214214337.2933ea41@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Dec 2015 20:24:30 +0000, Martin Bark wrote:

> I'm not sure the answer to that.  What i can say is that all four are
> getting maintained.  Also, according to https://github.com/nodejs/LTS
> node.js 0.10.x will be maintained all the way until October 2016.
> 
> I see two logical approaches for buildroot:
> 
> 1) Support all four in buildroot because node.js support all four
> 2) Only Support the 4.x and 5.x because they are the current LTS and
> Stable releases (i.e. the ones on the front page of
> https://nodejs.org)
> 
> Personally I'd vote for 2) because it simplifies things.
> 
> What are your thoughts?

I'm fine with option (2) as well, but do we have other NodeJS users
that would like to see 0.10.x and 0.12.x being kept?

Is there any issue for users of 0.10.x/0.12.x to migrate to 4.2 or 5.2 ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
