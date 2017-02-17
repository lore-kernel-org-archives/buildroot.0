From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Feb 2017 14:27:07 +0100
Subject: [Buildroot] [PATCH 1/2] wavpack: needs wchar support
In-Reply-To: <1487315522.2111.1.camel@embedded.rocks>
References: <20170216204116.2212-1-joerg.krause@embedded.rocks>
 <20170216221907.57ac4b8d@free-electrons.com>
 <f0dindxjng.ln2@ID-313208.user.individual.net>
 <1487315522.2111.1.camel@embedded.rocks>
Message-ID: <20170217142707.022435f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 Feb 2017 08:12:02 +0100, J?rg Krause wrote:

> Upstream committed a fix [1] (thanks to Thomas for reporting the issue)
> which drops the dependency on wchar. Maybe we should apply this to
> remove BR2_USE_WCHAR?

Yes, it would be best. Could you send a patch for this, of course after
checking it really fixes the build for a non-wchar toolchain.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
