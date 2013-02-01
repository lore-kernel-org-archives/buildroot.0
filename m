From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu, 31 Jan 2013 20:37:39 -0500
Subject: [Buildroot] RFC: add check for post-build script existence?
In-Reply-To: <20130131101346.6572d042@skate>
References: <CANxTyt5O6y45yR+ZecGGi4EomVU2mm4ar56g3iK7boGpFTQDOw@mail.gmail.com>
 <20130131101346.6572d042@skate>
Message-ID: <CANxTyt6n5dJyL8RNSDQ=G7i75d5jPwiXQYsXyhoHRcUY7_Ohgg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

> I'm not sure where you're getting ${BOARD_NAME} from, but why don't you
> handle the board differences in the script itself?

I forgot all about adding an "export" before the makefile variable
could also get passed to the bash script itself.  (To be honest, I
only recently learned that there actually *was* a makefile export
command.)  That's good enough for me.

Thanks for the prompt response and good advice.

Danomi -
