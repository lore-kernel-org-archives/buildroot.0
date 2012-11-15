From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 15 Nov 2012 12:16:07 -0300
Subject: [Buildroot] [PATCH] binutils: add version 2.23.1
In-Reply-To: <87lie25299.fsf@dell.be.48ers.dk>
References: <1352988528-20158-1-git-send-email-gustavo@zacarias.com.ar>
 <87lie25299.fsf@dell.be.48ers.dk>
Message-ID: <50A50737.3070001@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/15/2012 12:12 PM, Peter Korsgaard wrote:

> I know we have been doing it in the past because of various arch issues,
> but does it make sense to keep both 2.23 and 2.23.1?

I've tested 2.23.1 only for ppc targets so far, and 2.23 for many more
architectures.
Common sense says 2.23.1 alone should be enough, but i haven't tested
that scenario.
We also have other dot versions that could also be dropped like 2.20.
Regards.
