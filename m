From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Aug 2015 22:37:38 +0200
Subject: [Buildroot] [PATCH] package/canfestival: fix build with musl
In-Reply-To: <CA+BsyQ53-OSsdm=DONB9AX_K+y0a8AKnzf1SrRV7ykZVUagjkw@mail.gmail.com>
 (Brendan Heading's message of "Sat, 22 Aug 2015 23:35:00 +0100")
References: <1440279318-19132-1-git-send-email-yann.morin.1998@free.fr>
 <20150822213815.GA3861@free.fr>
 <CA+BsyQ5AaMkDCb7Ldnu5u9ZArNe0swiAhKwxsRgES6RdrxTVoQ@mail.gmail.com>
 <20150822222544.GB3861@free.fr>
 <CA+BsyQ53-OSsdm=DONB9AX_K+y0a8AKnzf1SrRV7ykZVUagjkw@mail.gmail.com>
Message-ID: <87r3mrxfxp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Brendan" == Brendan Heading <brendanheading@gmail.com> writes:

Hi,

 > I thought about submitting a patch with another #ifdef __UCLIBC__
 > around the function declaration - not ideal, but it at least matches
 > what the upstream were trying to do. But I wasn't sure if such an
 > approach would pass muster here ?

It would be good to get it acked by upstream / included in the git repo
so we can instead just bump the version.

-- 
Bye, Peter Korsgaard
