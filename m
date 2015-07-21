From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 22 Jul 2015 00:01:09 +0200
Subject: [Buildroot] [PATCH v7 1/1] Added linux drivers backports project
In-Reply-To: <20150719132950.GC4020@free.fr>
References: <1435791533-25991-1-git-send-email-petr.vorel@gmail.com>
 <20150719132950.GC4020@free.fr>
Message-ID: <20150721220108.GA1183@t61>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann and others,

> Since there's quite some work left to be done, and we would like to have
> this as part of the next release, I'm adopting this patch to fix the
> remaining issues that Arnout and I raised earlier.

I'm sorry, it took me a bit longer to reply, I was on holiday in the
mountains, without the internet.
I'm glad you want to have linux backports in next release :-).

IMHO the main problem is linux-configure dependency - I wasn't able to
trigger it. The rest should be easy to fix. I'll write a quick note to the other posts.

Kind regards,
Petr
