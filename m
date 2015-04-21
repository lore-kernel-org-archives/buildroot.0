From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Apr 2015 15:15:25 +0200
Subject: [Buildroot] [PATCH] system/skeleton: fix /etc/group
In-Reply-To: <CAMpxmJXPOBEORmNyqfF-dQ1vWaKaC_7Nqm4+AUcX=BD_c0QCbQ@mail.gmail.com>
 (Bartosz Golaszewski's message of "Tue, 21 Apr 2015 14:58:11 +0200")
References: <1429618945-21621-1-git-send-email-bgolaszewski@baylibre.com>
 <87618ptzgb.fsf@dell.be.48ers.dk>
 <CAMpxmJXPOBEORmNyqfF-dQ1vWaKaC_7Nqm4+AUcX=BD_c0QCbQ@mail.gmail.com>
Message-ID: <871tjdtyfm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bartosz" == Bartosz Golaszewski <bgolaszewski@baylibre.com> writes:

Hi,

>> Hmm, while the patch looks correct I don't see that error message
 >> here. What is your setup exactly?

 > Hi Peter,

 > maybe I didn't express myself right.

 > What I meant was busybox compiled manually from current busybox git -
 > as opposed to the archive normally downloaded by buildroot.

Ahh, ok - I see it now. The internal password routines in busybox have
recently been rewritten, so that's why we haven't seen it before.

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
