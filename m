From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Oct 2018 07:26:21 +0200
Subject: [Buildroot] Update the current date using ntp.
In-Reply-To: <4f85764f-4677-56bb-01f0-46def72c3d9b@mind.be> (Arnout
 Vandecappelle's message of "Mon, 15 Oct 2018 23:35:48 +0200")
References: <CALtfCQaov7R68HfvZtNOse+SGu9Y8vihS=4xgixjtjE__VXkkQ@mail.gmail.com>
 <CANQCQpZA_Xgjx+pKvZXp97VYvwk4M0M=PhaEUQQqu40QjV4_iQ@mail.gmail.com>
 <4f85764f-4677-56bb-01f0-46def72c3d9b@mind.be>
Message-ID: <871s8qo41u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  I believe chrony does all this automatically. I've used chrony on boards
 > without battery-backed RTC and the time is correct when I log in, without any
 > magic added by me.

FYI, this can be finetuned by the makestep configuration option:

https://chrony.tuxfamily.org/doc/3.4/chrony.conf.html#makestep

-- 
Bye, Peter Korsgaard
