From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Apr 2017 08:48:39 +0200
Subject: [Buildroot] [PATCH] ncftp: fix host/target confusion
In-Reply-To: <1ce8fc39-f994-0e53-4cbe-05a89a4c481f@mind.be> (Arnout
 Vandecappelle's message of "Sat, 15 Apr 2017 00:35:29 +0200")
References: <1488322477-25447-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170301214800.1a6c3405@free-electrons.com>
 <877f47hccp.fsf@dell.be.48ers.dk>
 <CANxTyt6tGknGoHc2swaeqh-h6L740Ny79UwgH4AqQH2SfjQYnQ@mail.gmail.com>
 <20170302214346.1157dda6@free-electrons.com>
 <87innqf5kd.fsf@dell.be.48ers.dk> <87tw75av93.fsf@dell.be.48ers.dk>
 <20170307211002.26e35c3f@free-electrons.com>
 <87lgsgbxo4.fsf@dell.be.48ers.dk>
 <1ce8fc39-f994-0e53-4cbe-05a89a4c481f@mind.be>
Message-ID: <87mvb3r7eg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 07-03-17 22:10, Peter Korsgaard wrote:
 >>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
 >> 
 >> 
 >> >> > Is this update intentional? Why was the tarball regenerated?  
 >> >> 
 >> >> Yes.
 >> >> 
 >> >> Which wasn't exactly helpful :/ I'll send a patch to update our hash,
 >> >> but I will NOT update the tarball on sources.buildroot.net yet.
 >> 
 >> > Isn't sources.buildroot.net going to automatically pick up the new
 >> > tarball once you change the hash?
 >> 
 >> Hmm, I guess so. It just runs 'make -k source'. I guess we should wait
 >> until we are ready to release 2017.02.1 then.

 >  So this issue missed 2017.02.1 :-)

Argh, yes :/

 >  However, we can do a workaround: in master, we can use the tar.gz file instead
 > of the tar.xz. That way, there can be two separate tarballs on
 > sources.buildroot.net for the two versions.

Ahh yes, good idea - I'll send a patch doing that.

-- 
Bye, Peter Korsgaard
