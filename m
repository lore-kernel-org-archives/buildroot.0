From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Oct 2014 13:40:24 +0200
Subject: [Buildroot] [PATCH 1/2] package/dovecot: New package
In-Reply-To: <XnsA3BB7588C35A8berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1411925137-11284-1-git-send-email-bernd.kuhls@t-online.de>
 <20140929191314.36b87a70@free-electrons.com>
 <XnsA3BB7588C35A8berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20141003134024.4de4020b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri, 03 Oct 2014 11:33:15 +0200, Bernd Kuhls wrote:

> how to do that?
> Are the websites where I can upload license files for checking?
> 
> I compared http://www.gnu.org/licenses/lgpl-2.1.txt and 
> http://www.dovecot.org/doc/COPYING.LGPL, they are 100% identical.
> 
> http://www.dovecot.org/doc/COPYING says:
> "Everything else is LGPLv2.1 (see COPYING.LGPL) unless otherwise mentioned
> at the beginning of the file."

Regarding LGPLv2.1 vs. LGPLv2.1+ it's not written in the license text
(the license text is just one particular version), but in the header of
each source file, where you have a "(or later)" specification if it's
with "+", or no such specification when it's just one particular
version that applies.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
