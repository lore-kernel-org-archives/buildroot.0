From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2016 23:30:36 +0200
Subject: [Buildroot] [PATCH v3 0/4] Add a get-developers script and
 database
In-Reply-To: <20160912211450.GB15314@free.fr>
References: <1473713695-2611-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160912211450.GB15314@free.fr>
Message-ID: <20160912233036.0168f9d6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Sep 2016 23:14:50 +0200, Yann E. MORIN wrote:

> On 2016-09-12 22:54 +0200, Thomas Petazzoni spake thusly:
> > This is the third version of the patch series adding a get-developers
> > script and the corresponding DEVELOPERS database.  
> 
> All I want to say is, just commit that already! ;-)
> 
> Seriously, this thing is working: we've been receiving notifications for
> some time now.
> 
> It will not be easy for you to maintain the developpers file locally, so
> if we want people to register as developpers, we need to have that in
> the tree.

Exactly my current issue: we're adding new packages, but since the
DEVELOPERS file is not in the tree, it doesn't get updated accordingly.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
