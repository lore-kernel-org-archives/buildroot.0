From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Wed, 12 May 2010 12:25:40 +0200
Subject: [Buildroot] webkit build fails
In-Reply-To: <1273659246.23023.15.camel@localhost>
References: <1273659246.23023.15.camel@localhost>
Message-ID: <AANLkTimgJbxIw53ObvnIfzytopuXoEEjM8WD-GxAHTzs@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 12, 2010 at 12:14 PM, Yavor Atov <yatov@gcn.bg> wrote:
> Hi everyone,
>
>
> So what do you think. Will updating libtool solve the problem?

Updating libtool won't solve your problem, but updating buildroot
might solve this issue.
If you don't want a complete update of buildroot, you can also try to
apply theses patches :

http://git.buildroot.org/buildroot/commit/?id=0d1830b07db4ebfd14e77a258de6fb391e57e960
http://git.buildroot.org/buildroot/commit/?id=6b939d40f6a29a43277566adc9d4312d49cb3abf
http://git.buildroot.org/buildroot/commit/?id=2eb4b09529a891e07d09ddf36c483b28edcd19ae

Regards,

--
Lionel Landwerlin

>
> Best regards,
> Yavor
>
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
