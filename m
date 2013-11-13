From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 13 Nov 2013 10:50:05 +0100
Subject: [Buildroot] [PATCH 1/1] omniorb: add COS Naming Service
In-Reply-To: <CAAXf6LWs9vXKEOQ7Pt2yteLnGHVsuNEJczVaR2AnwnCRwfbjyw@mail.gmail.com>
 (Thomas De Schampheleire's message of "Wed, 13 Nov 2013 10:07:25
 +0100")
References: <1384288305-4945-1-git-send-email-mlweber1@rockwellcollins.com>
 <9e8746c1-8e33-4c55-b4e2-b2b1e6181f86@email.android.com>
 <87txfh2r91.fsf@dell.be.48ers.dk>
 <CAAXf6LWs9vXKEOQ7Pt2yteLnGHVsuNEJczVaR2AnwnCRwfbjyw@mail.gmail.com>
Message-ID: <87txfg1vhu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

> Yuk, that's a pity...
> In this case my preference is to have the comment before the main
> option (so as close as possible), rather than after all sub options.

> What is your opinion?

I don't have a stong opion about it, but that's fine by me as well. For
simple packages (most), it imho is a bit more logical to have it after
the option though (and it's what we are currently doing most places).

-- 
Bye, Peter Korsgaard
