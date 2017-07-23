From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Jul 2017 09:57:25 +0200
Subject: [Buildroot] [git commit] python-systemd: add new package
In-Reply-To: <87a83vppud.fsf@dell.be.48ers.dk>
References: <20170720211905.D06A28027F@busybox.osuosl.org>
 <87a83vppud.fsf@dell.be.48ers.dk>
Message-ID: <20170723095725.62316c1a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Jul 2017 09:36:10 +0200, Peter Korsgaard wrote:

>  > commit: https://git.buildroot.net/buildroot/commit/?id=e9a6a104bc82fe6425dfcf9344f560904793c8f1
>  > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master  
> 
>  > Add package for official python bindings availibe as a part of systemd
>  > project at: https://github.com/systemd/python-systemd  
> 
>  > Minimal config snippet for utils/test-pkg is as follows (sans
>  > backslashes):  
> 
>  > BR2_INIT_SYSTEMD=y
>  > BR2_PACKAGE_PYTHON3=y
>  > BR2_PACKAGE_PYTHON_SYSTEMD=y  
> 
> So the # lines still got dropped :/

Might have been dropped by the git pwam process, or perhaps I did a git
commit --amend to fixup something in the patch or commit log.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
