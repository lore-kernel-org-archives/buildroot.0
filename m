From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Jul 2013 11:29:39 +0200
Subject: [Buildroot] [PATCH] system: add option to pass extra args to
 post-build and post-image scripts
In-Reply-To: <20130710091628.1d01d59c@skate>
References: <1373393196-19024-1-git-send-email-yann.morin.1998@free.fr>
 <20130709183505.GB3543@free.fr> <20130710091628.1d01d59c@skate>
Message-ID: <20130710112939.3cfc5b3b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wed, 10 Jul 2013 09:16:28 +0200, Thomas Petazzoni wrote:

> > After playing a bit with both solutions, it turned out to be not
> > entirely manageable, especially when the inrastructure put in place by
> > the functions changes, since all scripts must be changed accordingly.
> 
> I am not quite sure to understand why the symlink solution doesn't work
> in your case. Could you elaborate on that?
> 
> Regarding the patch itself, I'd say why not. I'm just wondering if it
> wouldn't be better to have separate arguments for both scripts. Not
> sure.

Ok, I see that it has already been committed, without more
discussion... Fair enough.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
