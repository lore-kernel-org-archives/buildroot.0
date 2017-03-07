From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Mar 2017 22:10:35 +0100
Subject: [Buildroot] [PATCH] ncftp: fix host/target confusion
In-Reply-To: <20170307211002.26e35c3f@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 7 Mar 2017 21:10:02 +0100")
References: <1488322477-25447-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170301214800.1a6c3405@free-electrons.com>
 <877f47hccp.fsf@dell.be.48ers.dk>
 <CANxTyt6tGknGoHc2swaeqh-h6L740Ny79UwgH4AqQH2SfjQYnQ@mail.gmail.com>
 <20170302214346.1157dda6@free-electrons.com>
 <87innqf5kd.fsf@dell.be.48ers.dk> <87tw75av93.fsf@dell.be.48ers.dk>
 <20170307211002.26e35c3f@free-electrons.com>
Message-ID: <87lgsgbxo4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:


 >> > Is this update intentional? Why was the tarball regenerated?  
 >> 
 >> Yes.
 >> 
 >> Which wasn't exactly helpful :/ I'll send a patch to update our hash,
 >> but I will NOT update the tarball on sources.buildroot.net yet.

 > Isn't sources.buildroot.net going to automatically pick up the new
 > tarball once you change the hash?

Hmm, I guess so. It just runs 'make -k source'. I guess we should wait
until we are ready to release 2017.02.1 then.

-- 
Bye, Peter Korsgaard
