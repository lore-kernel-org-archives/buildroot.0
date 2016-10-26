From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Oct 2016 23:28:15 +0200
Subject: [Buildroot] [PATCH] support/scripts: tool to create fragments
In-Reply-To: <20161026211708.GA3593@free.fr>
References: <1477425699-37971-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20161026211708.GA3593@free.fr>
Message-ID: <20161026232815.37e7580f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Oct 2016 23:17:08 +0200, Yann E. MORIN wrote:

> > +loadedFirstConfig=()
> > +loadedSecondConfig=()  
> 
> Declare the variables:
> 
>     declare -a loadedFirstConfig loadedSecondConfig

And don't use camel case naming for variables, please.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
