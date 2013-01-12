From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Jan 2013 13:10:19 +0100
Subject: [Buildroot] [PATCH 2/2] arptables: bump to version 0.0.4
In-Reply-To: <50F151F2.6020703@zacarias.com.ar>
References: <1357990675-12863-1-git-send-email-gustavo@zacarias.com.ar>
 <1357990675-12863-2-git-send-email-gustavo@zacarias.com.ar>
 <20130112125853.5cd7eba1@skate> <50F151F2.6020703@zacarias.com.ar>
Message-ID: <20130112131019.4ca0717b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat, 12 Jan 2013 09:07:14 -0300, Gustavo Zacarias wrote:

> > Could you add LICENSE and LICENSE_FILES while you're at it? :-)
> 
> Unfortunately it's not clear cut which license it's placed on.
> Presumably it's GPL since a quick search says:
> 
> arptables-v0.0.4 $ find . -type f -exec grep --with-filename GPL {} \;
> ./libarptc/libarptc.c:/* (C)1999 Paul ``Rusty'' Russell - Placed under
> the GNU GPL (See
> ./libarptc/libarptc_incl.c:/* (C)1999 Paul ``Rusty'' Russell - Placed
> under the GNU GPL (See
> ./include/linux/netfilter_arp.h: * (C)2002 Rusty Russell IBM -- This
> code is GPL.
> 
> But there's nothing else indicating so, and no detail as to which
> version of the GPL (presumably v2 because of the date, but no license
> files included).
> Should we go with v2 or just leave it be for the license experts?

Another option is to contact the authors and ask them to clarify the
licensing? It's not like Rusty Russell is MIA :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
