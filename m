From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 9 Mar 2012 15:18:07 +0100
Subject: [Buildroot] [RFC] Request for comment for branch
	for-2012.05/misc-cleanups
In-Reply-To: <20120309143326.24a2b90e@skate>
References: <cover.1331148806.git.thomas.petazzoni@free-electrons.com>
 <CAAAP30GZZM5F=f_iHZwUs+rgDGvHUgvFLm_Wdo7DLc4J1yQX3g@mail.gmail.com>
 <20120309143326.24a2b90e@skate>
Message-ID: <CAAXf6LXc+1QS5vr6JqLvJAYt0QHFYVetZF8E-hVqGioRMoDaHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 9, 2012 at 2:33 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Le Fri, 9 Mar 2012 10:07:29 -0300,
> Alexandre Pereira da Silva <aletes.xgr@gmail.com> a ?crit :
>
>> I think the pkg-* makefiles could be moved from the packages directory
>> as they are used by the kernel and bootloaders as well.
>> Maybe move them to the support directory.
>
> Yeah, I was also wondering about this. I don't know if support/ is the
> right place, or if we need yet another top-level directory such as
> include/ or mk/ or whatever. What are others opinion?

I don't think support/ is the right place, but I'm not against moving
these files elsewhere.
Not sure about the best name though...

Best regards,
Thomas
