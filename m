From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 15:46:50 +0200
Subject: [Buildroot] [PATCH 15/21] freeswitch: use SPDX short identifier
 for license strings
In-Reply-To: <859ce539-de85-64e6-6b04-d1e3ffb04d29@mind.be>
References: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
 <1490881430-10434-16-git-send-email-rahulbedarkar89@gmail.com>
 <859ce539-de85-64e6-6b04-d1e3ffb04d29@mind.be>
Message-ID: <20170401154650.587b5b51@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 31 Mar 2017 00:19:18 +0200, Arnout Vandecappelle wrote:

>  First of all, I think it's a very good idea to have first the fully automatic
> patches, and then do remaining fixups like this one.
> 
>  However, I think there is still a lot more to be fixed up. There are also
> plenty of places where we refer to (L)GPLv[23] in e.g. comments. So instead of
> this patch, I would add a series of patches that uses the same (or maybe
> slightly more generic) sed expressions but now doesn't limit to _LICENSE or to
> .mk files. I did a quick check, there are about 25 instances of GPLv left, but
> you need to filter out patches and _LICENSE_FILES, so perhaps an automatic sed
> expression is going to be difficult.
> 
>  Anyway, my message is: those 25 remaining instances should be replaced as well.

I've merged Rahul series as-is, and expect to get additional patches
fixing the remaining exceptions here and there. I didn't want to hold
off too long on Rahul series, as it's the stuff that quickly gets out
of date, and gets a lot of conflict when applied.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
