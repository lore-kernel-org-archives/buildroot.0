From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 05 Nov 2017 20:36:24 +0100
Subject: [Buildroot] Analysis of build results for 2017-10-30
In-Reply-To: <20171105154025.0d8c749d@windsurf.home> (Thomas Petazzoni's
 message of "Sun, 5 Nov 2017 15:40:25 +0100")
References: <20171031070013.AD75D207B2@mail.free-electrons.com>
 <20171031230519.3feb2619@windsurf> <20171102232155.11995715@windsurf>
 <ba942bc0-1444-1f44-875e-94dd973d6e09@mind.be>
 <20171104232055.2e196d56@windsurf> <877ev54qos.fsf@dell.be.48ers.dk>
 <20171105154025.0d8c749d@windsurf.home>
Message-ID: <87fu9s1ps7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Sat, 04 Nov 2017 23:36:19 +0100, Peter Korsgaard wrote:

 >> > I wouldn't mind removing it.  
 >> 
 >> > Peter? Your call?  
 >> 
 >> If the only thing broken about it is static linking then I think I would
 >> prefer to just mark it as !static for now.

 > There are only a few packages that select BR2_PACKAGE_GSTREAMER, so it
 > should be quite easy to do.

Great - Will you send patches for it or do you want me to handle it?

-- 
Bye, Peter Korsgaard
