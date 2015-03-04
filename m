From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 23:40:51 +0100
Subject: [Buildroot] [PATCH 1/2] package/vlc: express the dependency on
	freerdp
In-Reply-To: <87oao8s8ea.fsf@dell.be.48ers.dk>
References: <cover.1425507251.git.yann.morin.1998@free.fr>
 <f6508071f9c26276a9840a3f197ca5a866f1039e.1425507251.git.yann.morin.1998@free.fr>
 <20150304232410.175ac1ed@free-electrons.com>
 <87oao8s8ea.fsf@dell.be.48ers.dk>
Message-ID: <20150304234051.26830a00@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 04 Mar 2015 23:30:21 +0100, Peter Korsgaard wrote:

>  >> Explcitly add freerdp (if enabled) as a dependency of vlc to ensure
>  >> build order in every vases.
> 
>  > a vase is for flowers, I guess you wanted to say 'case', right?
> 
>  > Committed with this fixed.
> 
> But you forgot to fix the 'Explcitly' in the line above.

Damn :/ And it's a commit log, so I can't fix it once committed. Shame
on me.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
