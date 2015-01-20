From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 20 Jan 2015 21:27:22 +0100
Subject: [Buildroot] [PATCH 4/4] boot/syslinux: add host-perl dependency
In-Reply-To: <20150120085330.GA2146@tarshish>
References: <1421710198-20898-1-git-send-email-romain.naour@openwide.fr>
 <1421710198-20898-4-git-send-email-romain.naour@openwide.fr>
 <20150120085330.GA2146@tarshish>
Message-ID: <54BEBA2A.7050901@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Le 20/01/2015 09:54, Baruch Siach a ?crit :
> Hi Romain,
> 
> On Tue, Jan 20, 2015 at 12:29:58AM +0100, Romain Naour wrote:
>> Syslinux use a perl interpreter in it's build system,
>> so add host-perl as dependency.
> 
> Buildroot expects perl to be installed on the host system already. See ?2.1 
> (Mandatory packages) in the manual. AFAIK host-perl is only used to build perl 
> itself for the target.

Thanks for the reminder, I haven't checked if perl was a mandatory packages
before sending the patch...

> 
> Have you encountered any specific build failure?

Not at all.

Best regards,
Romain

> 
> baruch
> 
