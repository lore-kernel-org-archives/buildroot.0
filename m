From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 22 Jan 2012 22:43:38 +0100
Subject: [Buildroot] Buildroot RFS Login Question
In-Reply-To: <CAMe6wuROmEc_vWn8AqYdiRa9bo0Yc2iA9WAFbiy+kWohq09=Ag@mail.gmail.com>
 (Donald Poole's message of "Sat, 21 Jan 2012 16:53:21 -0600")
References: <CAMe6wuROmEc_vWn8AqYdiRa9bo0Yc2iA9WAFbiy+kWohq09=Ag@mail.gmail.com>
Message-ID: <87mx9fh0qd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Donald" == Donald Poole <donny3000@gmail.com> writes:

Hi,

CC'ed the buildroot list. Please keep replies on the list as well.

 Donald> Hello Peter,

 Donald>     First off, I would like to send my thanks and gratitude to
 Donald>     you and your team for creating/maintaining the buildroot
 Donald>     embedded filesystem generator.  ?It is a wonderful tool
 Donald>     that has save me (and I'm sure countless others) a lot of
 Donald>     time putting together a robust working filesytem for
 Donald>     embedded systems.

Thanks!

 Donald>     But, I do have a question regarding how
 Donald>     to login into the system once the filesystem is copied over
 Donald>     to the flash medium, nfs, etc. ?Is there a particular
 Donald>     username/password to use for logging into the system once
 Donald>     booted? ?I've searched the internet and read a lot of
 Donald>     mailing lists and forums with no success. ?My only solution
 Donald>     is to edit the /etc/inittab file and add the -n option for
 Donald>     no login prompt. ?But I'd like use the login prompt for
 Donald>     security and not having to hack the /etc/inittab file as a
 Donald>     work-around. ?I'm sure it's something dirt simple that I'm
 Donald>     missing, but I can't seem to put a finger on it. ?Any help
 Donald>     would be greatly appreciated!  ?Thanks in advance!

Ehh, unless you are using a custom filesystem skeleton, you should have
a root user without any password set. Does that not work for you?

If it doesn't, then please provide some more details about your setup
(buildroot config, how you boot your system, error messages?, ..)

-- 
Bye, Peter Korsgaard
