From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 May 2013 18:30:48 +0200
Subject: [Buildroot] [PATCH v2 00/12] RFC: ARC port
In-Reply-To: <E6BF041E97966E4DB955F0DF883AD2D6339FE6FE@de02wembxa.internal.synopsys.com>
References: <1366798403-6984-1-git-send-email-mjonker@synopsys.com>
 <20130425050221.4846d873@skate>
 <E6BF041E97966E4DB955F0DF883AD2D6339FA392@de02wembxa.internal.synopsys.com>
 <20130429224541.6f46b3b4@skate> <517FEC03.1010709@mind.be>
 <20130501000905.609d0ced@skate>
 <E6BF041E97966E4DB955F0DF883AD2D6339FE6A5@de02wembxa.internal.synopsys.com>
 <20130502171245.5f3f7f02@skate>
 <E6BF041E97966E4DB955F0DF883AD2D6339FE6FE@de02wembxa.internal.synopsys.com>
Message-ID: <20130502183048.21c282b0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mischa Jonker,

On Thu, 2 May 2013 15:18:50 +0000, Mischa Jonker wrote:

> > As I suggested in an earlier e-mail, I think you should just not care about 
> > this problem for now, and add the multiple 'depends on !BR2_arc'
> > as you were doing in your first version of the patch set. Your patch set 
> > already has a good number of patches, so let's merge it, and improve on 
> > top of that.
> 
> The v3 patch set does exactly that if I'm not mistaken. This is supposed to be
> the improvement part already:-)

Yeah, seen that. I replied before I saw your v3, and the gcc patches
that come after that. I'll focus on the ARC stuff for now.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
