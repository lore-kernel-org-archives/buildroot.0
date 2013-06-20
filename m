From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jun 2013 09:46:52 +0200
Subject: [Buildroot] [PATCH 09/12] luaposix: New package
In-Reply-To: <CADwac6BcbG6_K_zFbvh7UCB6gn=6dT_-FjqUL36nuMSqMQDy+Q@mail.gmail.com>
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
 <1369054604-26139-9-git-send-email-shmuelzon@gmail.com>
 <877ghppyyf.fsf@dell.be.48ers.dk>
 <CADwac6CSHFb=EGawg0x-QPhWpPoeZXtmzN9XtX-u23zittoCqQ@mail.gmail.com>
 <20130620081006.5adbce32@skate>
 <CADwac6AgCoqwwLZcJys51THfEmKunzY=QyNDwoBeS1H4ws=5CQ@mail.gmail.com>
 <CADwac6BcbG6_K_zFbvh7UCB6gn=6dT_-FjqUL36nuMSqMQDy+Q@mail.gmail.com>
Message-ID: <20130620094652.7fbf1476@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Assaf Inbal,

On Thu, 20 Jun 2013 10:39:43 +0300, Assaf Inbal wrote:

> OK, so I've done a bit more digging and saw that buildroot adds -rpath as a
> part of the HOST_LDFLAGS, but the problem was that this variable wasn't
> passed to Lua's make file.

Ok.

> So, I'm submitting now two patches. The first is for adding these flags to
> the host compilation of Lua and the second the for adding Luaposix, without
> the LD_LIBRARY_PATH hack.

Thanks, this looks a lot better!

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
