From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Wed, 24 Oct 2018 17:43:08 +0200
Subject: [Buildroot] [PATCH] package/ntp: use ntpd to set initial time
In-Reply-To: <3232b003-ae5e-43d1-b795-f73a0ed71624@mind.be>
References: <1540300218-59209-1-git-send-email-matthew.weber@rockwellcollins.com>
 <3c82f1ee-58b9-ef25-35d5-bd8fd25d4d48@mind.be>
 <CANQCQpYkLV-XJBVqRsQLdrxthZzkqctsBcxfX4mJQqFY16jk5Q@mail.gmail.com>
 <f544829d-68ed-abfc-306c-ce3cebb1de3b@mind.be>
 <CANQCQpYAjzXTQBDjKwbMPnQViP0=Qfpr6+pgs_3e7iGOYfo50g@mail.gmail.com>
 <3232b003-ae5e-43d1-b795-f73a0ed71624@mind.be>
Message-ID: <CALtfCQb77kufnmaC4ErrVEU4PGHZhtihQcJuGbxWSQOmCfAWag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

>  8 seconds is not good. We want to get the same sync time as with ntpdate,
> otherwise we're doing something wrong. And I guess ntpdate does it in a second,
> right?

I made a test on my Raspberry Pi 3B+ and it took me around 10-12
seconds to execute ntpdate.

Best regards.

Oscar Gomez Fuente
TST Sistemas
www.tst-sistemas.es
