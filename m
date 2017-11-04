From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Nov 2017 23:24:41 +0100
Subject: [Buildroot] BR2_REPRODUCIBLE issues
In-Reply-To: <5c52008b-1ffa-7260-8681-5abeecd09665@mind.be>
References: <1509720041684-0.post@n4.nabble.com>
 <87y3nn3yq6.fsf@dell.be.48ers.dk>
 <5c52008b-1ffa-7260-8681-5abeecd09665@mind.be>
Message-ID: <20171104232441.4d7a4754@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 4 Nov 2017 20:53:27 +0100, Arnout Vandecappelle wrote:

> > So I don't really agree that it useless. What we could perhaps do is to
> > only export our value for SOURCE_DATE_EPOCH if not already set in the
> > enviroment, so you can set it outside Buildroot if you want a different
> > behaviour.  
> 
>  Well, the proposed solution of using a config variable sounds OK. Only, I think
> it would make more sense to have a config variable with a date, rather than a
> commit ID.

Why would we want a config option, rather than just comply with the
SOURCE_DATE_EPOCH environment variable, if already defined in the
environment?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
