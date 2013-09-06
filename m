From: Assaf Inbal <shmuelzon@gmail.com>
Date: Fri, 6 Sep 2013 09:59:25 +0300
Subject: [Buildroot] [PATCH v2 1/2] getty: Create specific getty config
	+ cleanups
In-Reply-To: <CAAXf6LXGoMTiAQNqQ9UZCSzizZG+=tw_o5X4xBgmSQBJUG4cYg@mail.gmail.com>
References: <1377429219-25140-1-git-send-email-shmuelzon@gmail.com>
 <CAAXf6LV4mAJ77obaOx_7O9Dk_=a9oFGrW8QcFoAzdAKThAqjLA@mail.gmail.com>
 <CADwac6BfHWKP_HWd_3g6t8MqtSW4zTcpYbChpbPh0O3q-N4=Jg@mail.gmail.com>
 <CAAXf6LWkdfhGBsKvPpReEec2OXKdLgZbwSRwhCopqb06U6bKhA@mail.gmail.com>
 <CADwac6A7kn8sXLiQERrmk4iUbtob8oVqeTMcSYTd8rJW3d9wZg@mail.gmail.com>
 <CAAXf6LXGoMTiAQNqQ9UZCSzizZG+=tw_o5X4xBgmSQBJUG4cYg@mail.gmail.com>
Message-ID: <CADwac6BXiyNCCSgLCuXbWuqh1LtL2P+3jjMeB1HFUUNw-NxfUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

> I haven't seen a new version yet. When you have some time, could you
> do it? I think the patch series is a nice improvement so I don't want
> to loose this...

Sorry, got caught up by my actual day job :)
Two quick questions:
- Would it be better to create a sub menu called "getty options"? I
think that otherwise it would be clear what these options refer to. It
would also clean up the main "system" menu.
- In order to avoid the new thread that started with the 2nd version
of the patch, how should I configure git send-email to reply to this
thread? I altered the "reply-to" field but that didn't seem to work.

Good day,
Assaf
