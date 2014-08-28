From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 28 Aug 2014 09:08:58 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain/uclibc-ng: add support for
 uClibc-ng
In-Reply-To: <53FE6512.9050600@mind.be>
References: <20140811113124.GA19506@waldemar-brodkorb.de>
 <53FE6512.9050600@mind.be>
Message-ID: <20140828070858.GJ12857@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,
Arnout Vandecappelle wrote,

>  Hi Waldemar,
> 
> On 08/11/14 13:31, Waldemar Brodkorb wrote:
> > uClibc-ng is a spin-off of uClibc. uClibc-ng will do
> > a 1.0 release really soon. uClibc lacks releases and
> > the maintainer does not communicate any timeplans for
> > releases. For more information about uClibc-ng see:
> > http://www.uclibc-ng.org
> 
>  What a surprising lack of reaction on this patch! I'd have expected people to
> welcome this very much...

I haven't thought of many comments, but no reaction was a little bit
disappointing.
 
>  However, I'll start with immediately burning it to the ground :-) I think the
> situation of uClibc-ng is very similar to eglibc: it's essentially the same
> package, just a different version of it. So, instead of creating a whole new
> copy, I think it's easier to maintain if it is one more uclibc version in
> package/uclibc/Config.in.
 
Okay, thanks for the feedback.

In the meantime I started from scratch with the spin-off. See here
for details:
http://blog.waldemar-brodkorb.de/index.php?archives/17-English.html&serendipity[lang_selected]=en&serendipity[user_language]=en

May be the next buildroot version can contain uClibc-ng support.

best regards
 Waldemar
