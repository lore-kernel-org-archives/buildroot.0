From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 23 Feb 2017 12:42:54 -0300 (BRT)
Subject: [Buildroot] [git commit] util-linux: security bump to version
 2.29.2
In-Reply-To: <20170223085742.C646982235@busybox.osuosl.org>
References: <20170223085742.C646982235@busybox.osuosl.org>
Message-ID: <595202195.11970979.1487864574446.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Peter Korsgaard" <peter@korsgaard.com>
> To: buildroot at buildroot.org
> Sent: Thursday, February 23, 2017 5:55:57 AM
> Subject: [Buildroot] [git commit] util-linux: security bump to version 2.29.2

> commit:
> https://git.buildroot.net/buildroot/commit/?id=a5015f1025a1aee173c2c2ab39ccac5ce38f30c3
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> From
> https://www.kernel.org/pub/linux/utils/util-linux/v2.29/v2.29.2-ReleaseNotes
> 
> This release fixes su(1) security issue CVE-2017-2616:
> 
>  It is possible for any local user to send SIGKILL to other processes with root
>  privileges.  To exploit this, the user must be able to perform su with a
>  successful login.  SIGKILL can only be sent to processes which were executed
>  after the su process.  It is not possible to send SIGKILL to processes which
>  were already running.

Should not this go to next too, since it is a security fix?

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
