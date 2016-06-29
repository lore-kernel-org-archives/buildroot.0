From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jun 2016 16:11:37 +0200
Subject: [Buildroot] [PATCH 00/24] Drop unused host packages
In-Reply-To: <CAHfJR7h01DTkHetP0W196NbmeHCNZZjw6Ju-D9uP3pA6+A1gNw@mail.gmail.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
 <20160629155233.510c456e@free-electrons.com>
 <CAHfJR7h01DTkHetP0W196NbmeHCNZZjw6Ju-D9uP3pA6+A1gNw@mail.gmail.com>
Message-ID: <20160629161137.5b5a13b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Jun 2016 16:00:13 +0200, Julien Floret wrote:

> > Can you confirm this is something you have taken into account?  
> 
> No, I'm afraid I missed this point, sorry...
> I checked only for dependencies on host-foo, or BR2_PACKAGE_HOST_FOO presence.

Then you might have missed some of the possible uses of those host
packages, I'm afraid :-/

Can you double check this, and see if your series still applies or
whether it should be reworked ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
