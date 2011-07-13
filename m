From: Daniel Mack <daniel@zonque.org>
Date: Wed, 13 Jul 2011 18:36:03 +0200
Subject: [Buildroot] Depending on uClibc configuration variables
In-Reply-To: <87sjqadtwr.fsf@macbook.be.48ers.dk>
References: <CACTFLAORWLAkCfzgfMxu_75txKhFiuxNfF4t81nQ5646BMngWw@mail.gmail.com>
 <87mxgifyd1.fsf@macbook.be.48ers.dk>
 <CACTFLAO+rT2UEZ+wJ_8ePQwbbG6m9B4SfPtm8chUzkzS_PoKGw@mail.gmail.com>
 <20110713163105.37f42131@skate>
 <CACTFLAOtkXndrv1G6xkKa1K=_J8bGZi3hBHc9TbkWxUpiYJp4w@mail.gmail.com>
 <20110713182431.1163f950@skate>
 <87sjqadtwr.fsf@macbook.be.48ers.dk>
Message-ID: <CACTFLAMrGpqoJNJq=2xYwiEi_MY4Eo_JBEf3tHnsVBLfX0R+3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 13, 2011 at 6:31 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>
> ?Thomas> Le Wed, 13 Jul 2011 16:36:28 +0200,
> ?Thomas> Daniel Mack <daniel@zonque.org> a ?crit :
>
> ?>> > What is the binary size impact of having your option enabled in uClibc ?
> ?>>
> ?>> It adds ~5kb.
>
> ?Thomas> Then I would say that we can include the feature in our default uClibc
> ?Thomas> configuration.

Ok, that's easy then.

> But it's the uClibc patches Daniel recently posted, isn't it? Those
> afaik aren't integrated in uClibc git yet.

No, I'm still waiting for review and it probably needs one or more
cycles to make it happen.

I'm just preparing patches for buildroot in parallel, and came across
this problem. So for the first shot, we would depend on a BR2
snapshot, and once a new release is ready, add this as dependency
option. Correct?

Daniel
