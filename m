From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Mar 2017 21:31:21 +0100
Subject: [Buildroot] [PATCH] kmscube: Move to the new repository
In-Reply-To: <CAOMZO5Bpy6sBTTX1sHitL8mRsNDNF1_PWsvqRTrvfzhd2xG45A@mail.gmail.com>
References: <1488803273-25019-1-git-send-email-festevam@gmail.com>
 <20170306212225.0819a97b@free-electrons.com>
 <CAOMZO5Bpy6sBTTX1sHitL8mRsNDNF1_PWsvqRTrvfzhd2xG45A@mail.gmail.com>
Message-ID: <20170306213121.203079d8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 6 Mar 2017 17:26:30 -0300, Fabio Estevam wrote:
> Hi Thomas,
> 
> On Mon, Mar 6, 2017 at 5:22 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> 
> > Applied to master, thanks.  
> 
> There last line of the commit log (# kmscube -D /dev/dri/card1) has
> been dropped.
> 
> Was this intentional?

No: but it started with #, so when I did a "git commit --amend" to
adjust the commit title, it got removed, and I didn't notice.

Don't start lines with # if you want them to be kept by Git :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
