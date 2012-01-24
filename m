From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 24 Jan 2012 21:29:13 +0100
Subject: [Buildroot] Buildroot RFS Login Question
In-Reply-To: <CAMe6wuTrAtUXsjByY6pBd9-wZKme0gyvSTzsPnEiFGK3X-n=3g@mail.gmail.com>
 (Donald Poole's message of "Tue, 24 Jan 2012 10:39:44 -0600")
References: <CAMe6wuROmEc_vWn8AqYdiRa9bo0Yc2iA9WAFbiy+kWohq09=Ag@mail.gmail.com>
 <87mx9fh0qd.fsf@macbook.be.48ers.dk>
 <CAMe6wuTrAtUXsjByY6pBd9-wZKme0gyvSTzsPnEiFGK3X-n=3g@mail.gmail.com>
Message-ID: <87pqe89752.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Donald" == Donald Poole <donny3000@gmail.com> writes:

Hi,

 Donald> Unfortunately, if I use the root user get a "Login Incorrect"
 Donald> message and a new login prompt that looks like this: Starting
 Donald> input-event-daemon: done


 Donald>     Welcome to VICTORY Embedded
 Donald>     victory-embedded login: root
 Donald>     Login incorrect

 Donald>     victory-embedded login:


 Donald> I'm using the default filesystem skeleton. ?I'm not sure what
 Donald> buildroot config information would be helpful, so I will need
 Donald> some more direction on what to give you guys for
 Donald> assistance. But i am using udev, my getty port is ttymxc0 at
 Donald> 115200 baudrate and I'm using BusyBox 1.19.x in the "Package
 Donald> Selection for Target" configuration. ?I'm also using buildroot
 Donald> version builroot-2011.11.

Ok, and how do you boot the system, what kind of filesystem output are
you using?

-- 
Bye, Peter Korsgaard
