From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Mar 2015 13:23:09 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-03-18
In-Reply-To: <550AB83E.5050400@imgtec.com>
References: <20150319073018.35B45100D3A@stock.ovh.net>
 <550AA255.3060206@imgtec.com> <20150319103012.GC2415@tarshish>
 <550AB83E.5050400@imgtec.com>
Message-ID: <20150319132309.285f72de@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 19 Mar 2015 12:51:26 +0100, Vicente Olivert Riera wrote:

> Yes, I agree with that. Perhaps you could ask lua-periphery upstream and
> tell them to not do that :P

Well, you can create a c-periphery package, which lua-periphery depends
on, and then pass the appropriate C_PERIPHERY / C_PERIPHERY_LIB values
when building lua-periphery.

Maybe Fran?ois could have a look into this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
