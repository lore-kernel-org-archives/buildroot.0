From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Mar 2017 16:32:11 +0100
Subject: [Buildroot] [PATCH 3/3] package/nodejs: remove 0.10.x support
In-Reply-To: <20170306211322.GD3976@free.fr> (Yann E. MORIN's message of "Mon, 
 6 Mar 2017 22:13:22 +0100")
References: <1488671310-27378-1-git-send-email-martin@barkynet.com>
 <1488671310-27378-3-git-send-email-martin@barkynet.com>
 <8fcfeb3e-38c3-3fa7-99fd-feca53e7160f@mind.be>
 <CAFGQKxeAv8j=vAO5TrcZT8r0a8kCneTR4qa9rhz=daHbwnavkQ@mail.gmail.com>
 <4a35c4cc-f487-84c5-e2cc-80655f0e53eb@mind.be>
 <20170306211322.GD3976@free.fr>
Message-ID: <87innlcdc4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 >> Note that in that December 2015 thread, Yann suggested to keep 0.10
 >> indefinitely, but everybody else seemed to agree with Martin's suggestion to
 >> drop it.

 > Well, my position at the time wwas that "As long as it builds and still
 > works fine, we should just keep it."

 > But now, 0.10.x is only for armv5. Do we really expect such a low-end
 > system to run nodejs?

 > I don't care much about maintaining 0.10.x, especially now since
 > upstream compleely dropped support.

I also don't think we can realisticly support it longer term going
forward if upstream won't any more, so I'm ok with dropping it.

-- 
Bye, Peter Korsgaard
