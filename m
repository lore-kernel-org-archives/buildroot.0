From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Thu, 30 Oct 2014 10:37:49 +0100
Subject: [Buildroot] [PATCH] inetutils: new package
In-Reply-To: <852735167.27218624.1414655605361.JavaMail.root@openwide.fr>
References: <1414624048-37143-1-git-send-email-kaszak@gmail.com>
 <852735167.27218624.1414655605361.JavaMail.root@openwide.fr>
Message-ID: <CABbD_XB2q_Vqn0cyJgHjeCPtLUrbC=rt7=VxLJhNwkX819Lu_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jeremy,

indeed there are many programs in inetutils, that are also provided by
other packages.
I decided to split the package into 6 separate parts, so "one does not
simply" need to compile/carry everything :)
Inetutils is the GNU implementation of these, the user can choose whatever
fits best for him/her.

My primary reason for adding Inetutils is telnet (and telnetd), which are
not provided by anything else, if
the user chooses not to use Busybox.

Best regards,
Karoly

On Thu, Oct 30, 2014 at 8:53 AM, Jeremy Rosen <jeremy.rosen@openwide.fr>
wrote:

>
> ----- Mail original -----
> > GNU Inetutils is a collection of common network programs.
> > Clients included:
> > dnsdomainname, ftp, hostname, ifconfig, logger, ping, ping6, rcp,
> > rexec, rlogin, rsh, talk, telnet, tftp, traceroute, whois
>
> ifconfig and hostname are already in the package "net-tools" are they
> related ? is that a different provider for the package ?
>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141030/0c1bb943/attachment.html>
