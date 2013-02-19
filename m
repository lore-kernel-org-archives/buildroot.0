From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 19 Feb 2013 18:11:53 -0300
Subject: [Buildroot] SSHFS userland support
In-Reply-To: <718DFA7882181D45B8BD18F31C46D55427A6A846@MBX204.domain.local>
References: <718DFA7882181D45B8BD18F31C46D55427A6A7E0@MBX204.domain.local>,
 <201302192130.29112.yann.morin.1998@free.fr>
 <718DFA7882181D45B8BD18F31C46D55427A6A846@MBX204.domain.local>
Message-ID: <5123EA99.304@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/19/2013 06:04 PM, Gregory Perry wrote:
> Thanks Yann.
> 
> Using the most recent buildroot-stable, there is no sshfs option under that
> menu, only a squashfs option.  But what's weird about it, directly under
> the squashfs option is a "*** sshfs requires a toolchain..." message.  Maybe
> there is a typo/bug with the most recent buildroot-stable?  Or do I not have
> the right FUSE dependencies selected elsewhere?
> 
> Thanks in advance

"sshfs requires a toolchain with LARGEFILE, WCHAR and threads support"

That means go to the toolchain menu and enable the requested options,
it'll show up then, you'll see.
Regards.
