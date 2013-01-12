From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 12 Jan 2013 09:07:14 -0300
Subject: [Buildroot] [PATCH 2/2] arptables: bump to version 0.0.4
In-Reply-To: <20130112125853.5cd7eba1@skate>
References: <1357990675-12863-1-git-send-email-gustavo@zacarias.com.ar>
 <1357990675-12863-2-git-send-email-gustavo@zacarias.com.ar>
 <20130112125853.5cd7eba1@skate>
Message-ID: <50F151F2.6020703@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/12/2013 08:58 AM, Thomas Petazzoni wrote:

> Could you add LICENSE and LICENSE_FILES while you're at it? :-)

Unfortunately it's not clear cut which license it's placed on.
Presumably it's GPL since a quick search says:

arptables-v0.0.4 $ find . -type f -exec grep --with-filename GPL {} \;
./libarptc/libarptc.c:/* (C)1999 Paul ``Rusty'' Russell - Placed under
the GNU GPL (See
./libarptc/libarptc_incl.c:/* (C)1999 Paul ``Rusty'' Russell - Placed
under the GNU GPL (See
./include/linux/netfilter_arp.h: * (C)2002 Rusty Russell IBM -- This
code is GPL.

But there's nothing else indicating so, and no detail as to which
version of the GPL (presumably v2 because of the date, but no license
files included).
Should we go with v2 or just leave it be for the license experts?
Regards.
