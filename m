From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Aug 2012 15:43:38 +0200
Subject: [Buildroot] git clone with http not giving me commits after Jul
 6
In-Reply-To: <20120813135640.7735d625@cfl-science.lanl.gov>
References: <20120813121005.3aeda200@cfl-science.lanl.gov>
 <502958DC.3050705@googlemail.com>
 <20120813135640.7735d625@cfl-science.lanl.gov>
Message-ID: <20120814154338.278520d1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Neale,

Le Mon, 13 Aug 2012 13:56:40 -0600,
Neale Pickett <neale@lanl.gov> a ?crit :

> I'm unable to use the git protocol because it is firewalled out where I
> work.
> 
> The problem may be that update-server-info has quit running.  This
> would explain the behavior I'm observing (git protocol is current, http
> protocol is not).  It may also be my company's HTTP proxy, although I'm
> doubtful that it has still cached a manifest file from over a month ago.

Yes, this is a known issue since I have replaced Peter as the Buildroot
maintainer. When I push, I have a message that tells me "Permission
denied" on the execution of the post-commit hook, which means that the
update-server-info git command is not being executed on the server. We
started investigating this problem with Peter, but then he left for
holidays and the problem remained unresolved.

I'll try to contact the system administrators to see if we can get this
problem fixed. In any case, as soon as Peter comes back as a
maintainer, the problem will be solved.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
