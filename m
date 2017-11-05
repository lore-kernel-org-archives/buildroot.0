From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Nov 2017 15:40:25 +0100
Subject: [Buildroot] Analysis of build results for 2017-10-30
In-Reply-To: <877ev54qos.fsf@dell.be.48ers.dk>
References: <20171031070013.AD75D207B2@mail.free-electrons.com>
 <20171031230519.3feb2619@windsurf>
 <20171102232155.11995715@windsurf>
 <ba942bc0-1444-1f44-875e-94dd973d6e09@mind.be>
 <20171104232055.2e196d56@windsurf>
 <877ev54qos.fsf@dell.be.48ers.dk>
Message-ID: <20171105154025.0d8c749d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 04 Nov 2017 23:36:19 +0100, Peter Korsgaard wrote:

>  > I wouldn't mind removing it.  
> 
>  > Peter? Your call?  
> 
> If the only thing broken about it is static linking then I think I would
> prefer to just mark it as !static for now.

There are only a few packages that select BR2_PACKAGE_GSTREAMER, so it
should be quite easy to do.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
