From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Mar 2015 09:40:08 +0100
Subject: [Buildroot] [PATCH 2/2] samba4: bump to version 4.2.0
In-Reply-To: <54F8F0AC.8030707@zacarias.com.ar>
References: <1425588249-20942-1-git-send-email-gustavo@zacarias.com.ar>
 <1425588249-20942-2-git-send-email-gustavo@zacarias.com.ar>
 <20150305232946.3620697e@free-electrons.com>
 <54F8F0AC.8030707@zacarias.com.ar>
Message-ID: <20150306094008.7baf8c91@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 05 Mar 2015 21:11:24 -0300, Gustavo Zacarias wrote:

> > This cleanup of the indentation is definitely good, but has nothing to
> > do with the bump to 4.2.0. It should be part of a separate patch.
> 
> Well, it's pointless IMHO to split it, since some options changed and
> it's a major bump, does it really make sense?
> I won't make a badly-indented 4.2.x package file to fix it later, it
> would be pointless. It'll give me one more commit that doesn't do
> anything useful.
> And "fixing" 4.1.x just to just stomp on it later with the bump would
> make no sense either, same case, many changes.

I'm sorry, but I don't buy this. Separating logical changes is
something we ask to all contributors. And the specific chunk I pointed
at does not change at *all* when doing the 4.1 -> 4.2 bump. And even if
some parts of it are changed by the 4.1 -> 4.2 bump, that's OK.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
