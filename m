From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Apr 2015 17:38:55 +0200
Subject: [Buildroot] [PATCH] lirc-tools: fix build with host python3
In-Reply-To: <20150405153454.GA2183@tarshish>
References: <a17acfb3c3818b1ccc0c2a98ff8993574d83f001.1428247566.git.baruch@tkos.co.il>
 <20150405172857.7b773e82@free-electrons.com>
 <20150405153454.GA2183@tarshish>
Message-ID: <20150405173855.526c152c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Sun, 5 Apr 2015 18:34:54 +0300, Baruch Siach wrote:

> > So what about:
> > 
> >  * Using #!/usr/bin/env python in the script, and make the script both
> >    python 2 and python 3 compliant.
> > 
> >  * Use $(if $(BR2_PACKAGE_PYTHON3),host-python3) in the dependencies ?
> 
> Are both needed? If the script is compliant with both python2 and python3, 
> then we can rely on the host provided python in case host-python3 has not been 
> built by the time lirc-tools builds, isn't it?

True.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
