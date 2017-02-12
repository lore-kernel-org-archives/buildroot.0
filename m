From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Feb 2017 18:28:26 +0100
Subject: [Buildroot] [PATCH v5] gtest/gmock: bump to version 1.8.0
In-Reply-To: <116271.9983971.1486911743876.JavaMail.zimbra@datacom.ind.br>
References: <1473290219-27701-1-git-send-email-casantos@datacom.ind.br>
 <c410065bcf02dbf9548965118905fb4e0edfcc40.1486901824.git.casantos@datacom.ind.br>
 <20170212153749.7f9aff72@free-electrons.com>
 <116271.9983971.1486911743876.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20170212182826.58d53bad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Feb 2017 13:02:23 -0200 (BRST), Carlos Santos wrote:

> > Is there a good reason to not install directly gmock_gen.py as
> > gmock_gen ?  
> 
> IIRC some of out tests build calling gmock_gen.py and other calling gmock_gen
> but I need to check that tomorrow, at office. Right now I'm at home, without
> access to that code.

OK. Since it's weird, perhaps make sense to add a quick comment above
this piece of code.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
