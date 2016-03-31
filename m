From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 31 Mar 2016 07:28:44 -0300
Subject: [Buildroot] [PATCH] mesa3d: add intel gallium driver support
In-Reply-To: <20160331040040.0083ba81@free-electrons.com>
References: <1457632891-4354-1-git-send-email-gustavo@zacarias.com.ar>
 <8760wum7dj.fsf@dell.be.48ers.dk> <56E1D44F.70807@zacarias.com.ar>
 <3979rcxl7o.ln2@ID-313208.user.individual.net>
 <871t7hjmol.fsf@dell.be.48ers.dk> <56E2A91A.1030509@zacarias.com.ar>
 <20160331040040.0083ba81@free-electrons.com>
Message-ID: <56FCFBDC.8010903@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/03/16 23:00, Thomas Petazzoni wrote:

> "DRI drivers need X.org" ? This seems wrong, since you precisely sent a
> patch recently to all DRI drivers to be built without X.org.
>
> So I guess this specific patch, allowing to build the unmaintained
> Intel Gallium driver is no longer needed?
>
> I've marked it as Rejected on patchwork for now. Let me know if you
> disagree for some reason.
>
> Thanks!
>
> Thomas

Hi Thomas.
The gallium intel driver wasn't cutting it like Bernd said so i 
tried/investigated the DRI route and it worked out.
So yes, even though it might be academically interesting to have the 
option to build the intel gallium driver it's pretty much useless so no 
argument from me since i got what was really interesting from the other 
patchset.
Regards.
