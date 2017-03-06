From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Mar 2017 09:13:53 +0100
Subject: [Buildroot] [PATCH] odroid-mali: mark package as BROKEN
In-Reply-To: <746ac932-fe6d-bbe0-0b87-b17fc76810af@mind.be>
References: <1488638059-6764-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170305213723.021d4678@free-electrons.com>
 <b81cad7b-504e-b927-3f62-844925aba881@mind.be>
 <20170305234052.2515068d@free-electrons.com>
 <746ac932-fe6d-bbe0-0b87-b17fc76810af@mind.be>
Message-ID: <20170306091353.3a1e60aa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 6 Mar 2017 00:35:54 +0100, Arnout Vandecappelle wrote:

>  I think an outright removal (with the original contributors in Cc) is an
> equally strong incentive.

Agreed :-)

> > Let's say that we'll remove this package before the 2017.05 release if
> > nobody unbreaks it?  
> 
>  And what with the 6 other packages (or package options) marked as broken? Can
> we kill it?

Those ones have been marked as BROKEN since even longer, so I'm all for
removing them.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
