From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 22:30:16 +0100
Subject: [Buildroot] [PATCH 1/2] rsyslog: remove pointless umask from
 sysv initscript
In-Reply-To: <54B6DD46.9040007@zacarias.com.ar>
References: <1421266617-9201-1-git-send-email-gustavo@zacarias.com.ar>
 <20150114221549.5f12df01@free-electrons.com>
 <54B6DD46.9040007@zacarias.com.ar>
Message-ID: <20150114223016.1d50d7c9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 14 Jan 2015 18:19:02 -0300, Gustavo Zacarias wrote:

> > Thanks, both patches applied. I've added 3 more patches on top to do
> > some further minor cleanup/improvements in rsyslog.mk.
> 
> The explicit disable is a bit redundant since most rsyslog options are
> default off but upstream can always change that and silently break
> things on bumps on the other hand.

Well, we already had an explicit disable for libgcrypt, and for most
packages, we try to make the disable explicit anyway, so I simply erred
on the safe side here.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
