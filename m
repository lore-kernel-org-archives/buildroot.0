From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 30 May 2019 14:38:05 +0200
Subject: [Buildroot] [PATCH v2 3/6] support/gnuconfig: update to
 2019-05-28
In-Reply-To: <877ea844ag.fsf@dell.be.48ers.dk>
References: <20190528203416.32261-1-thomas.petazzoni@bootlin.com>
 <20190528203416.32261-4-thomas.petazzoni@bootlin.com>
 <877ea844ag.fsf@dell.be.48ers.dk>
Message-ID: <20190530143805.39abac31@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 May 2019 12:36:55 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:  
> 
>  > This update includes support for the C-SKY architecture.
>  > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>  > ---
>  > Note: this was suggested by Peter for next, instead of just patching
>  > the files to add csky support. It should be applied after
>  > cherry-picking 910b431d6383cd1ce4cd9eeb0a8466cb977c3789 from master.  
> 
> Are you sure about that? It seems to apply nicely as is to next, and
> fail with a merge conflict if I cherry-pick 910b431?

Yes, because I did the patch based on next. But you know that master
had a change on gnuconfig to support the C-SKY architecture. So perhaps
I should send a series that is based on next + the c-sky patch that is
already in master ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
