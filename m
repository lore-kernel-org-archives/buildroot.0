From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 10:47:32 +0100
Subject: [Buildroot] [PATCH 1/2] package/{python,
 python3}: add mechanism to exclude .py files from removal
In-Reply-To: <20191129103955.095dcd3d@windsurf> (Thomas Petazzoni's message of
 "Fri, 29 Nov 2019 10:39:55 +0100")
References: <20191127203404.291090-1-thomas.petazzoni@bootlin.com>
 <20191127203404.291090-2-thomas.petazzoni@bootlin.com>
 <87blsvf7bx.fsf@dell.be.48ers.dk> <20191129085623.67aee606@windsurf>
 <87eexrcaen.fsf@dell.be.48ers.dk> <20191129103955.095dcd3d@windsurf>
Message-ID: <87k17jaua3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Fri, 29 Nov 2019 10:13:52 +0100
 > Peter Korsgaard <peter@korsgaard.com> wrote:

 >> > Gaah, check-package doesn't allow us from doing these nice hacks. We
 >> > could exclude this variable from the check-package check, but that's
 >> > really getting into doing a hack within the hack.  
 >> 
 >> > So I guess this really means we have to go with a per-package variable,
 >> > and a bit of logic in pkg-generic to collect these per-package
 >> > variables into a global one. Agreed?  
 >> 
 >> I am afraid so. Will you take care of it?

 > Yes, I'll try to have a look.

Thanks!

 > Not sure if it will be ready for the release, though.

Ok. This has been broken for a _LONG_ time, so postponing it to
2019.11.1 is probably not a big deal.

-- 
Bye, Peter Korsgaard
