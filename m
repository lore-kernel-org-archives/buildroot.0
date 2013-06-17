From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 17 Jun 2013 11:26:27 -0500
Subject: [Buildroot] [RFC] ti-gfx: add new package
In-Reply-To: <51BF10BE.2010502@andin.de>
References: <CALo-6+j77P2RsdYRO9BR04rUX-j0HmxzXtBuHzo_UQ1wDjXbHQ@mail.gmail.com>
 <1370636307-23089-1-git-send-email-spenser@gillilanding.com>
 <CALo-6+ihs6caa98RCvZmZKZ5pUsfXjXPPBJn_zG4J6eBBpsuAw@mail.gmail.com>
 <CAEBucnC-HdSyDttBo4te_=eOR259ebSAwWQuE_W3zcyLVjwSQA@mail.gmail.com>
 <EE4E4767751A8B40949306E403F4DDD802EEB1D7@sv03ultra002.ultratronik.de>
 <CAEBucnD1-qa-mf5w1o9JaAFQArd_tTO0K=7rCC3k3LNMazDdFw@mail.gmail.com>
 <51BF10BE.2010502@andin.de>
Message-ID: <CAEBucnA96tZNo=_o57Bu2jh39vq3SutUJzgJoB4amMESdrS5wA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Naumann,

>> To solve this problem, an ifdef on the kernel version should be done.
>> I'll try to figure out which version incorporated the clock changes
>> and add this to the patch.
>
>
> It came in in 3.2.

Great.  I'll add this to the patch.

>
> I'm a little on hold until I get further with the qmake issue, but I'm
> thinking about further integrating the target install step. How can we work
> together on this? I mean, in case you (or I) want to incorporate Arnouts
> comments and then go further?

I'm usually much more on top of things.  Last week I had to get a
paper done so I had to put this project on the back burner.  I'm going
to incoporate all the changes suggested and hopefully have a new patch
out by this afternoon (CST). Everything will be available from the
beaglxm branch of my github repo at
http://github.com/Spenser309/buildroot and the new patch will be sent
to the list.

Spenser

--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
