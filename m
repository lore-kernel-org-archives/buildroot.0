From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Dec 2014 12:23:08 +0100
Subject: [Buildroot] [PATCH] package/nettle: fix shared-only build
In-Reply-To: <20141213100040.GA4198@free.fr> (Yann E. MORIN's message of "Sat, 
 13 Dec 2014 11:00:40 +0100")
References: <1418419668-13558-1-git-send-email-yann.morin.1998@free.fr>
 <87zjarrkbn.fsf@dell.be.48ers.dk> <20141213100040.GA4198@free.fr>
Message-ID: <87mw6rrdyb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

>> Committed, thanks - Don't forget to send the patch upstream.

 > Well, upstream has changed quite a bit since version 2.7.1. There is a
 > new 3.0 release, and the patch no longer applies because they changed
 > the way they link with internal libs.

 > However, what they've done seems to also work for us. So I'm trying to
 > bump nettle now. But that's a different story than fixing the build
 > failures.

Ahh ok, thanks!

-- 
Venlig hilsen,
Peter Korsgaard 
