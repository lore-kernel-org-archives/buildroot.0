From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Jun 2015 22:42:17 +0200
Subject: [Buildroot] [PATCH] musl: bump to version 1.1.9
In-Reply-To: <1433267860-839-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 2 Jun 2015 14:57:40 -0300")
References: <1433267860-839-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87y4k1suza.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/musl/musl.hash | 2 +-
 >  package/musl/musl.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/musl/musl.hash b/package/musl/musl.hash
 > index 20bb2f8..02c366b 100644
 > --- a/package/musl/musl.hash
 > +++ b/package/musl/musl.hash

J?rg Krause had already submitted an identical patch, so I've applied
that one instead and marked this as superseeded:

http://patchwork.ozlabs.org/patch/476176/

-- 
Bye, Peter Korsgaard
