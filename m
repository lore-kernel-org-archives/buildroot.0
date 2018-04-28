From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 12:20:04 +0200
Subject: [Buildroot] [PATCH RFC] legal-info: add option to store
 manifest in rootfs
In-Reply-To: <e8f0d25b-5d96-9b31-4203-4074f804680c@gmail.com>
References: <20180426193252.19616-1-yann.morin.1998@free.fr>
 <20180427154650.3710e52e@windsurf>
 <fcf05ec0-3482-d265-c186-64492601e8a6@lucaceresoli.net>
 <20180427200245.GA14947@scaer>
 <0862ab07-5d01-eaf2-9da6-d50bf13f029f@lucaceresoli.net>
 <e8f0d25b-5d96-9b31-4203-4074f804680c@gmail.com>
Message-ID: <20180428122004.5909043f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 27 Apr 2018 14:39:20 -0700, Florian Fainelli wrote:

> > Well, sure, it makes some sense _practically_, but not _legally_ AFAICU,
> > because to be compliant you still would need a written license statement
> > (e.g. in the printed user manual).
> > 
> > Do we want to support every way that makes sense? We have two at least:
> > store the manifest and store manifest + license text. If we want to
> > support both, maybe that would actually carry more complexity than
> > usefulness, I'm afraid.
> > 
> > But of course I might be partially wrong! :-]  
> 
> Let's drop this, I was not thinking this would go into such a lengthy
> discussion, I will keep the local hack I have with make legal-info in
> post-build.sh. Thanks a lot for your help Yann!

Well, could you share some details about your specific use-case ? As
explained by Luca, having just the list of software components and the
name of their license isn't enough, the complete license text is needed
for licence compliance.

Knowing this, what is the use-case for having just the manifest ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
