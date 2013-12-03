From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Dec 2013 11:28:15 +0100
Subject: [Buildroot] [PATCH 4/5] zsh: alpha sort menu option
In-Reply-To: <20131203095020.2a02cf8f@skate> (Thomas Petazzoni's message of
 "Tue, 3 Dec 2013 09:50:20 +0100")
References: <1385981368-2235-1-git-send-email-gustavo@zacarias.com.ar>
 <1385981368-2235-4-git-send-email-gustavo@zacarias.com.ar>
 <87iov6pd8f.fsf@dell.be.48ers.dk> <20131203095020.2a02cf8f@skate>
Message-ID: <871u1up6tc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> You are right, certainly - But I think it is more userfriendly to make
 >> an exception and keep all the shells together.
 >> 
 >> What do others think?

 > Ideas:

 >  * Instead of "Shell and utilities", have two menus: "Shell" and
 >    "Utilities".

 >  * In the "Shell and utilities" menu, create two sub-sections,
 >    separated by comments:

 > comment "Shells"
 > ... some packages ...

 > comment "Utilities"
 > ... some packages ...

Sounds good to me.

-- 
Bye, Peter Korsgaard
