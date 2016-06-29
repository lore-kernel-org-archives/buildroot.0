From: Julien Floret <julien.floret@6wind.com>
Date: Wed, 29 Jun 2016 16:30:34 +0200
Subject: [Buildroot] [PATCH 00/24] Drop unused host packages
In-Reply-To: <20160629161137.5b5a13b3@free-electrons.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
 <20160629155233.510c456e@free-electrons.com>
 <CAHfJR7h01DTkHetP0W196NbmeHCNZZjw6Ju-D9uP3pA6+A1gNw@mail.gmail.com>
 <20160629161137.5b5a13b3@free-electrons.com>
Message-ID: <CAHfJR7iZpPnpVB0NqQPCEvYU7myCsdW2x=m5aoi1KGZk0p_MTg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> > Can you confirm this is something you have taken into account?
>>
>> No, I'm afraid I missed this point, sorry...
>> I checked only for dependencies on host-foo, or BR2_PACKAGE_HOST_FOO presence.
>
> Then you might have missed some of the possible uses of those host
> packages, I'm afraid :-/
>
> Can you double check this, and see if your series still applies or
> whether it should be reworked ?

It surely needs some rework, sorry for the noise!
From your comments, I also understand some host packages should be kept
even if they are unused in buildroot upstream (e.g. jsmin), so I guess it's not
trivial for me to know which packages could be removed.
