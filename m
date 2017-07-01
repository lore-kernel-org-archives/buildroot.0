From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 18:27:17 +0200
Subject: [Buildroot] [PATCH 4/7 v4] tools: move size-stat-compare out of
 support/scripts/
In-Reply-To: <CAAXf6LVF7gAph5SJqCAPjGgagckQOyO0Ud_Xqbdj=+kTGqzY5g@mail.gmail.com>
References: <cover.1498919458.git.yann.morin.1998@free.fr>
 <1f7606d932bd480bca466181658e656f93c4fe9e.1498919458.git.yann.morin.1998@free.fr>
 <CAAXf6LVF7gAph5SJqCAPjGgagckQOyO0Ud_Xqbdj=+kTGqzY5g@mail.gmail.com>
Message-ID: <20170701182717.30bda462@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 1 Jul 2017 18:02:57 +0200, Thomas De Schampheleire wrote:

> > diff --git a/tools/readme.txt b/tools/readme.txt
> > index fc1108fded..dd8a1d4494 100644
> > --- a/tools/readme.txt
> > +++ b/tools/readme.txt
> > @@ -11,6 +11,12 @@ get-developpers
> >      of Buildroot, so they can be Cc:ed on a mail. Accepts a patch as
> >      input, a package name or and architecture name.
> >
> > +size-stat-compare
> > +    a script to compare the rootfs size between two differnt Buildroot  
> 
> You must have missed my comment about 'differnt' -> 'different'
> 
> > +    configurations. This can be used to identify the size impact of
> > +    a specific option, or of a set of specific options, or an update
> > +    to a newer Buildroot version...  
> 
> While you're at it, the last clause would either also need 'of': 'or
> of an update...',
> or otherwise it would need to be removed on the second clause, but now
> it is inconsistent.

Sorry, I have already pushed. Can you send a patch? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
