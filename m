From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Jul 2015 11:25:15 +0200
Subject: [Buildroot] [PATCH v3 4/5] qt5webengine: new package
In-Reply-To: <55ACBCAF.6050404@ecagroup.com>
References: <1436380555-13657-3-git-send-email-corjon.j@ecagroup.com>
 <1436538022-18924-1-git-send-email-corjon.j@ecagroup.com>
 <1436538022-18924-4-git-send-email-corjon.j@ecagroup.com>
 <20150719150236.422b5b79@free-electrons.com>
 <55ACBCAF.6050404@ecagroup.com>
Message-ID: <20150720112515.0b05d1ef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien,

On Mon, 20 Jul 2015 09:17:35 +0000, Julien CORJON wrote:

> It's look like I forget to send the cover letter for this series...
> I submited the qt webengine in hurry since you had the hackathon on the 
> week-end and did not want you to review the v2 of qt5.5.0 integration.
> 
> In the missing cover letter I explained that qtwebengine was an work in 
> progress and should not be considered as a commit request.
> 
> Instead of split qtwebengine in an other series I keep this one in 
> qt5.5.0 bump series as it depend on it. Not sure it was a good idea...

Ok, then maybe your next version should only contain the Qt 5.5 bump,
and then you can send the qt5webengine patch separately once you
consider it ready.


> > So you need qt5webchannel, so this patch should come *after*
> > qt5webchannel is added as a package in your series.
> >
> 
> I messed-up with git (I had mixed rebase/amend on several branches) and 
> did not find a way to force webchannel before webengine in patches order.

Just use 'git rebase -i'. It allows you to re-order your commits at any
time.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
