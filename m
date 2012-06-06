From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 06 Jun 2012 22:13:58 +0200
Subject: [Buildroot] [PATCH] added package sftpserver
In-Reply-To: <20120606221113.63a66610@skate> (Thomas Petazzoni's message of
 "Wed, 6 Jun 2012 22:11:13 +0200")
References: <CABJxTWFdYodgaKy3vG03aJrxnerCrxTsjRPWm1q8U_XkQukz0w@mail.gmail.com>
 <20120606221113.63a66610@skate>
Message-ID: <87aa0gi4ft.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> That's the problem I have with your approach: when we want to upgrade
 Thomas> openssh, we will have to upgrade in two different places.

 Thomas> I would very much prefer to see a contribution made to openssh to get
 Thomas> the capability of building / installing only sftp-server, but I'm not
 Thomas> the Buildroot maintainer, so my opinion is just one amongst many
 Thomas> others :)

I agree that would be a much nicer long term solution, yes. I haven't
looked at the patch yet to see how easy that is to do though.

-- 
Bye, Peter Korsgaard
