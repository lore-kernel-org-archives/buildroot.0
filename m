From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Mar 2017 21:10:02 +0100
Subject: [Buildroot] [PATCH] ncftp: fix host/target confusion
In-Reply-To: <87tw75av93.fsf@dell.be.48ers.dk>
References: <1488322477-25447-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170301214800.1a6c3405@free-electrons.com>
 <877f47hccp.fsf@dell.be.48ers.dk>
 <CANxTyt6tGknGoHc2swaeqh-h6L740Ny79UwgH4AqQH2SfjQYnQ@mail.gmail.com>
 <20170302214346.1157dda6@free-electrons.com>
 <87innqf5kd.fsf@dell.be.48ers.dk> <87tw75av93.fsf@dell.be.48ers.dk>
Message-ID: <20170307211002.26e35c3f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 07 Mar 2017 17:48:08 +0100, Peter Korsgaard wrote:
> >>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:  
> 
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:  
>  > Hi,  
> 
>  >> I'm not sure what to do in this case? Blindly take the new upstream
>  >> version? Complain to upstream?  
> 
>  > We should probably update. I have mailed support at ncftp.com asking them
>  > what happened.  
> 
>  > I will let you know when/if I hear back from them.  
> 
> After sending them a detailed mail explaining the issue with them
> updating the tarballs and a diff of the changes, I got the following
> answer:
> 
> > Is this update intentional? Why was the tarball regenerated?  
> 
> Yes.
> 
> Which wasn't exactly helpful :/ I'll send a patch to update our hash,
> but I will NOT update the tarball on sources.buildroot.net yet.

Isn't sources.buildroot.net going to automatically pick up the new
tarball once you change the hash?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
