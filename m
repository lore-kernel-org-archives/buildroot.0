From: James Balean <james@balean.com.au>
Date: Tue,  4 Apr 2017 22:29:50 -0500
Subject: [Buildroot] [PATCH] Add out-of-source U-Boot device tree support
In-Reply-To: <20170329090909.4c74c734@free-electrons.com>
References: <1490595146-5638-1-git-send-email-james@balean.com.au>
 <07d14184-7b9c-dd29-569c-db46aa765118@mind.be>
 <1490681640-14995-1-git-send-email-james@balean.com.au>
 <54cae0a0-a7a5-9ef0-08c8-a14e871cf8bb@mind.be>
 <20170328215334.405952d9@free-electrons.com>
 <1d453613-dc32-9ab1-229b-2deed767a12f@mind.be>
 <20170328222929.036d1152@free-electrons.com>
 <92078ad6-2fcc-69e4-86b9-0d296ef350c0@mind.be>
 <20170329090909.4c74c734@free-electrons.com>
Message-ID: <1491362990-3697-1-git-send-email-james@balean.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Thank you for your responses. I will submit a new version of the patch
with your suggestions following this.

On 29 March 2017 at 18:09, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> > > Not necessarily. The DT can be used by U-Boot itself to know which
> > > peripherals are available, and how they should be configured.  
> > 
> >  But U-Boot can always pass the device tree it uses internally to
> >  the kernel, no?
> 
> I don't know. Would have to check.

I believe it is possible to use U-Boot's device tree blob when booting
Linux. U-Boot's DTB is simply concatenated on the end of itself, so the
address at which the blob starts could be determined and supplied to the
'bootm' command when booting Linux. I have not tested this though, so
will report back if I get around to it.

Thanks again,
James
