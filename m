From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Oct 2015 14:22:07 +0200
Subject: [Buildroot] [PATCH] python-ranger: new package
In-Reply-To: <20151021141313.37715fb8@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 21 Oct 2015 14:13:13 +0200")
References: <1445367699-13964-1-git-send-email-thijsvermeir@gmail.com>
 <20151021134806.4c7a27ff@free-electrons.com>
 <8737x4iged.fsf@dell.be.48ers.dk>
 <20151021141313.37715fb8@free-electrons.com>
Message-ID: <87y4ewh0nk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Indeed, I was thinking the same. Question is if we want to forcible
 >> select python / python3 (and if so, which one?) or if it should depend
 >> on them.

 > Good that we agree :)

Yeah ;)

 > Or alternatively, if we don't want to hide to the user that this tool
 > is going to bring Python into the build, we could:

We already do so for E.G. dstat, so unless kconfig gets confused about
the conditional selects I think we should go for it.

-- 
Venlig hilsen,
Peter Korsgaard 
