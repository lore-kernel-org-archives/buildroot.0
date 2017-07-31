From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 31 Jul 2017 08:06:18 -0300 (BRT)
Subject: [Buildroot] [PATCH 1/1] util-linux: bump to v2.30.1
In-Reply-To: <20170729153602.22599-1-m.hoffmann@cartelsol.com>
References: <20170729153602.22599-1-m.hoffmann@cartelsol.com>
Message-ID: <444949365.2448670.1501499178309.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Marcus Hoffmann" <m.hoffmann@cartelsol.com>
> To: buildroot at buildroot.org
> Cc: "Carlos Santos" <casantos@datacom.ind.br>, "Marcus Hoffmann" <m.hoffmann@cartelsol.com>
> Sent: Saturday, July 29, 2017 12:36:02 PM
> Subject: [PATCH 1/1] util-linux: bump to v2.30.1

> - Drop patch 0002-column-fix-compilation-when-libc-lacks-wide-characte.patch
> as it has been applied upstream
> - Patch 0001-Revert-build-sys-ncurses-headers-cleanup.patch is still
> required to fix ncursesw support.
> 
> Signed-off-by: Marcus Hoffmann <m.hoffmann@cartelsol.com>
> Cc: "Carlos Santos" <casantos@datacom.ind.br>
> ---
> @Carlos: As far as I could find no upstream discussion has taken place
> regarding the 0001 patch right? Do you want to send an email to the list
> describing the problem?

Hum, I got distracted with other things here. I will take care of this
today. Thanks for the reminder!

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
