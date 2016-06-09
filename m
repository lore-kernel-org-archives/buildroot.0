From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 10:56:24 +0200
Subject: [Buildroot] [PATCH 2/2] package/nodejs: bump version to 0.10.45
In-Reply-To: <CAFGQKxcfoAfYSgD+TBiXco8mwfQr2-3xRoj4HVZgS-_JtfeFzA@mail.gmail.com>
References: <1462803501-15901-1-git-send-email-martin@barkynet.com>
 <1462803501-15901-2-git-send-email-martin@barkynet.com>
 <20160608234429.6875d0a3@free-electrons.com>
 <CAFGQKxcfoAfYSgD+TBiXco8mwfQr2-3xRoj4HVZgS-_JtfeFzA@mail.gmail.com>
Message-ID: <20160609105624.7b1e2810@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 9 Jun 2016 09:49:58 +0100, Martin Bark wrote:

> > I am not sure if it is a fall-out of the 0.10.45 bump, of the more
> > recent CONF_OPTS changes, but we have a build failure:
> >
> >    http://autobuild.buildroot.net/results/932/932e4ec24623592255f234a098f7a90ef2ad8063/build-end.log
> >
> > Could you have a look?  
> 
> I just submitted a patch which should fix this, see
> http://patchwork.ozlabs.org/patch/632681/

Yep, seen the patch, already applied! Thanks a lot for looking into the
issue.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
