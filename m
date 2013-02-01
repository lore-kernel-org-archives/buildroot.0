From: john <john.osullivan@cloudiumsystems.com>
Date: Fri, 01 Feb 2013 17:30:26 +0000
Subject: [Buildroot] Problem build haserl with lua support
In-Reply-To: <20130131125234.166475a7@skate>
References: <1359630353.9888.41.camel@john-ubu> <20130131125234.166475a7@skate>
Message-ID: <1359739826.4447.6.camel@john-ubu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Thomas,

I was just wondering what would be involved in updating the package
directory in Buildroot 2012.05 with the latest versions of haserl and
lua. Is it simply a matter of lets say copying the relevant package
directories for these appsa from buildroot-2012.11.1 into Buildroot
2012.05?
If possible I would like to stay with Buildroot 2012.05 for the
immediate future.

regards

On Thu, 2013-01-31 at 12:52 +0100, Thomas Petazzoni wrote:
> Dear john,
> 
> On Thu, 31 Jan 2013 11:05:53 +0000, john wrote:
> > Hi,
> > 
> > I'm using Buildroot 2012.05 and am trying to configure haserl v0.9.X
> > with lua support. I select the lua intrepreter and have not selected lua
> > library modules.
> 
> You may want to update your Buildroot version, because I think the
> problem have been fixed:
> 
> https://bugs.busybox.net/show_bug.cgi?id=5354
> 
> See commit 684f208ec 'lua: don't be fancy when creating shared library'.
> 
> Best regards,
> 
> Thomas
