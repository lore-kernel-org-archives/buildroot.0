From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Feb 2015 17:53:30 +0100
Subject: [Buildroot] Is there a package for Google Mock?
In-Reply-To: <CAJ4jsafg_ai99RY0gjW-FMd+HTX2+7Wb73wzx6m0j8jsgBfsPw@mail.gmail.com>
References: <CAJ4jsafg_ai99RY0gjW-FMd+HTX2+7Wb73wzx6m0j8jsgBfsPw@mail.gmail.com>
Message-ID: <20150213175330.223064da@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carlos A. M. dos Santos,

On Fri, 13 Feb 2015 10:33:10 -0200, Carlos A. M. dos Santos wrote:

> If not, would it be useful for the buildroot user community?
> 
> Context: my company is developing a product using buildroot and we use
> GMock to test C++ code.

There is no package for Google Mock in Buildroot at the moment. Feel
free to have a look, and submit a patch to add this package!

From a quick look, it's an autotools-based package, which sounds great.
However, they seem to be doing something a bit funky with the Python
detection, not sure if this is going to cause problems or not.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
