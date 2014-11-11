From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Nov 2014 23:15:42 +0100
Subject: [Buildroot] [PATCH 0/4] rt-tests: patches rename & versoin bump
 & support of non-NPTL tools
In-Reply-To: <87h9y5mp2f.fsf@dell.be.48ers.dk>
References: <1415613549-2886-1-git-send-email-abrodkin@synopsys.com>
 <20141111154340.258edd64@free-electrons.com>
 <1415718077.4122.19.camel@abrodkin-8560l.internal.synopsys.com>
 <20141111161056.52d0cee7@free-electrons.com>
 <87h9y5mp2f.fsf@dell.be.48ers.dk>
Message-ID: <20141111231542.0c3142c1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 11 Nov 2014 21:59:04 +0100, Peter Korsgaard wrote:

> Indeed. You can enable it by default with something like:
> 
> git config --global diff.renames copy

Ah, yes, that's what I have in my ~/.gitconfig, which explains why I
never use "git format-patch -M" and still have proper rename detection
enabled for all the patches I send. Something I must have enabled years
ago, and I forgot about it.

Thanks for the clarification anyway,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
