From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 May 2015 15:48:26 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <5548C487.90604@gmail.com>
References: <20150505063016.079181016A5@stock.ovh.net>
 <20150505095952.4ddfd5b4@free-electrons.com>
 <5548C487.90604@gmail.com>
Message-ID: <20150505154826.65c104f8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 05 May 2015 15:24:23 +0200, Pascal Huerst wrote:

> According to:
> 
> https://breakpad.appspot.com/2824002/
> 
> support has been added for release r1407. I tried to build that
> revision, but I got the same error as reported above. I'm not really
> familiar with the internals of breakpad, but I asked on the breakpad
> mailing list. Maybe someone there already knows that issue... I'll keep
> you updated.

Thanks. We'll wait a bit for them to give some feedback, and if it
doesn't come soon enough, we'll disable breakpad on aarch64 for now.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
