From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Mar 2013 11:58:29 +0100
Subject: [Buildroot] providing post-build scripts in buildroot
In-Reply-To: <1825560181.231790.1362740139485.JavaMail.root@openwide.fr>
References: <1890922777.231675.1362739947331.JavaMail.root@openwide.fr>
 <1825560181.231790.1362740139485.JavaMail.root@openwide.fr>
Message-ID: <20130308115829.700879e1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jeremy Rosen,

On Fri, 8 Mar 2013 11:55:39 +0100 (CET), Jeremy Rosen wrote:

> I am currently creating a couple of post-build scripts for my own personal use that could 
> be usefull for the general audience...
> 
> * copy the local id_ras.pub to the target
> * generate the host key of the target during build time
> * copy the target's host key to the known_host of the user
> 
> Since post-build is a new feature I was wondering if the project was opened to distributing that 
> sort of scripts somewhere in the support directory ( something like support/post-build)

I don't have a strong opinion on this, but doesn't this belongs to the
documentation instead?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
