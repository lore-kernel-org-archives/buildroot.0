From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Jan 2015 23:24:20 +0100
Subject: [Buildroot] [PATCH 4/4] boot/syslinux: add host-perl dependency
In-Reply-To: <54BEBA2A.7050901@openwide.fr>
References: <1421710198-20898-1-git-send-email-romain.naour@openwide.fr>
 <1421710198-20898-4-git-send-email-romain.naour@openwide.fr>
 <20150120085330.GA2146@tarshish> <54BEBA2A.7050901@openwide.fr>
Message-ID: <20150126232420.0fc0cc92@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Tue, 20 Jan 2015 21:27:22 +0100, Romain Naour wrote:

> > Buildroot expects perl to be installed on the host system already. See ?2.1 
> > (Mandatory packages) in the manual. AFAIK host-perl is only used to build perl 
> > itself for the target.
> 
> Thanks for the reminder, I haven't checked if perl was a mandatory packages
> before sending the patch...
> 
> > Have you encountered any specific build failure?
> 
> Not at all.

So I'll mark the patch as Rejected in patchwork. Thanks Romain and
Baruch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
