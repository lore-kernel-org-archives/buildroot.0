From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 6 Sep 2013 10:18:43 +0200
Subject: [Buildroot] [PATCH v2 1/2] getty: Create specific getty config
	+ cleanups
In-Reply-To: <CADwac6BXiyNCCSgLCuXbWuqh1LtL2P+3jjMeB1HFUUNw-NxfUg@mail.gmail.com>
References: <1377429219-25140-1-git-send-email-shmuelzon@gmail.com>
 <CAAXf6LV4mAJ77obaOx_7O9Dk_=a9oFGrW8QcFoAzdAKThAqjLA@mail.gmail.com>
 <CADwac6BfHWKP_HWd_3g6t8MqtSW4zTcpYbChpbPh0O3q-N4=Jg@mail.gmail.com>
 <CAAXf6LWkdfhGBsKvPpReEec2OXKdLgZbwSRwhCopqb06U6bKhA@mail.gmail.com>
 <CADwac6A7kn8sXLiQERrmk4iUbtob8oVqeTMcSYTd8rJW3d9wZg@mail.gmail.com>
 <CAAXf6LXGoMTiAQNqQ9UZCSzizZG+=tw_o5X4xBgmSQBJUG4cYg@mail.gmail.com>
 <CADwac6BXiyNCCSgLCuXbWuqh1LtL2P+3jjMeB1HFUUNw-NxfUg@mail.gmail.com>
Message-ID: <CAAXf6LXxx=RABEh52D7AaO2Ob2cYyUXN-why9-d+Z8=aqFfzpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 6, 2013 at 8:59 AM, Assaf Inbal <shmuelzon@gmail.com> wrote:
> Hey,
>
>> I haven't seen a new version yet. When you have some time, could you
>> do it? I think the patch series is a nice improvement so I don't want
>> to loose this...
>
> Sorry, got caught up by my actual day job :)
> Two quick questions:
> - Would it be better to create a sub menu called "getty options"? I
> think that otherwise it would be clear what these options refer to. It
> would also clean up the main "system" menu.

We don't usually have real submenus in buildroot, but I don't have a
very strong opinion on this.

> - In order to avoid the new thread that started with the 2nd version
> of the patch, how should I configure git send-email to reply to this
> thread? I altered the "reply-to" field but that didn't seem to work.

There are different opinions in the buildroot community regarding the
desirability of such in-reply-to patches. I'm personally not an
opponent of it, for the following reasons:

1. from the list of e-mails (in gmail for example) it is unclear if
the new reply is just a comment on the current version of the patch,
or if it is a new version. You really have to check the reply.

2. it doesn't work well for patch series: the first patch would indeed
be a reply to the previous thread, but all other patches would not.
This makes it very annoying to read all patches in a series.

Therefore, I always send new versions as new standalone e-mails, with
a marker vX to indicate the version. Several other buildroot
contributors do the same.

Best regards,
Thomas
