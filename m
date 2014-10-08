From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Oct 2014 20:05:05 +0200
Subject: [Buildroot] [PATCH 1/5] dash: bump to version 0.5.8-1
In-Reply-To: <5435748A.3090106@zacarias.com.ar> (Gustavo Zacarias's message of
 "Wed, 08 Oct 2014 14:29:46 -0300")
References: <1412774389-11297-1-git-send-email-gustavo@zacarias.com.ar>
 <87eguieaky.fsf@dell.be.48ers.dk> <5435748A.3090106@zacarias.com.ar>
Message-ID: <87k34acu9a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > On 10/08/2014 02:27 PM, Peter Korsgaard wrote:
 >> So what about bash? Which one should "win"? bash?

 > We can't make that determination on the user behalf if he selected
 > multiple shells, random order will prevail.
 > However we can say that any of these is more feature-complete than what
 > busybox has to offer.

Random is not good, so I suggest we either:

- Only do it for bash like today
- Provide an option for the user to select
- Decide on a fixed priority order (E.G. busybox->dash->zsh->bash) and
  tell people to use a post-build script if they are not happy with it

-- 
Bye, Peter Korsgaard
