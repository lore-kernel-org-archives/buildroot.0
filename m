From: Gilles Talis <gilles.talis@gmail.com>
Date: Wed, 7 Aug 2019 09:12:05 +0200
Subject: [Buildroot] [PATCH] package/restclient-cpp: new package
In-Reply-To: <CAFSsvmojqYth-0HAdBB5ya9ba_DvbMRA1S2jx0FtiJUyAL2OKA@mail.gmail.com>
References: <1564937071-4979-1-git-send-email-gilles.talis@gmail.com>
 <CAFSsvmojqYth-0HAdBB5ya9ba_DvbMRA1S2jx0FtiJUyAL2OKA@mail.gmail.com>
Message-ID: <CAKcgs2zKkzfg7C_YJ3KF2pSMxMMkiWtz482P=9c3TM+KzBn5eA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

Thanks for your review.

Le mer. 7 ao?t 2019 ? 00:16, Adam Duskett <aduskett@gmail.com> a ?crit :
>
> Hi Gilles;
>
> On Sun, Aug 4, 2019 at 12:44 PM Gilles Talis <gilles.talis@gmail.com> wrote:
> >
> Generally there's a description of what the package is/does at the
> beginning of a patch.
OK. Will add this.


> > +RESTCLIENT_CPP_VERSION = 0.5.1
> > +RESTCLIENT_CPP_SOURCE = $(RESTCLIENT_CPP_VERSION).tar.gz
> > +RESTCLIENT_CPP_SITE = https://github.com/mrtazz/restclient-cpp/archive
> Please use the github macro:
> $(call github,mrtazz,restclient-cpp,$(RESTCLIENT_CPP_VERSION))
You're right. Following your comment, I re-read the user manual, and
it makes better sense now :-)

I will send a v2 shortly.
Regards
Gilles.
