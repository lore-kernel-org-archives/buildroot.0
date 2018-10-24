From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 14:32:32 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/ca-certificates: don't hash
 certificates.crt
In-Reply-To: <baa8cebb-20a7-2dc2-a80b-c380721ff0ec@mind.be> (Arnout
 Vandecappelle's message of "Sun, 21 Oct 2018 14:38:14 +0100")
References: <20180616220601.4629-1-martin@barkynet.com>
 <20180616220601.4629-2-martin@barkynet.com>
 <20180617212547.4bc868c3@windsurf>
 <CAFGQKxeOmRCBUu7XFCDkpRbFV51F0=A8htjRMc75rKQA8_VtoQ@mail.gmail.com>
 <20180618163931.4531ccb3@windsurf>
 <CAFGQKxcC+jryJo8RBHU00ATeRqMqmbTn_+4jcgHqj+_=kH0mLw@mail.gmail.com>
 <96e0d9ee-e017-9745-4fae-eaa535e77118@mind.be>
 <baa8cebb-20a7-2dc2-a80b-c380721ff0ec@mind.be>
Message-ID: <8736sva5jz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

>> Could you check if I'm correct, and if so, resubmit the series with:
 >> 
 >> - the additional rm -f;
 >> - a commit message that includes the explanation above;
 >> - drops patch 2.
 >> 
 >> If patch 2 really is needed, it needs a better explanation.

 > ?Investigating a bit more turns out that I was rather wrong. The rm -f is
 > already there, as correctly noted in your commit message. And patch 2 really is
 > needed, it fixes a completely different set of duplicates.


 > ?So I've extended the commit message a little and applied to master, thanks.

Committed to 2018.02.x and 2018.08.x with the extended commit message, thanks.

-- 
Bye, Peter Korsgaard
