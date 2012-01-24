From: Patryk Benderz <Patryk.Benderz@esp.pl>
Date: Tue, 24 Jan 2012 15:33:39 +0100
Subject: [Buildroot] [RFC] Firmware handling in BR
In-Reply-To: <1327414346-12587-1-git-send-email-yegorslists@googlemail.com>
References: <1327414346-12587-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1327415619.15610.211.camel@esp-patben-lin.espdx1.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dnia 2012-01-24, wto o godzinie 15:12 +0100, yegorslists at googlemail.com
pisze:
> So I made the first attempt to add binary firmware images to BR. I
> placed the stuff under "Hardware handling" in the configuration menu,
> but I think it would be better to place this menu direct under
> "Package selection for the target".
Wherever you choose to put it, please state explicitly in comment that
it is closed binary blob.
-- 
Patryk "LeadMan" Benderz
Linux Registered User #377521
()  ascii ribbon campaign - against html e-mail
/\  www.asciiribbon.org   - against proprietary attachments
