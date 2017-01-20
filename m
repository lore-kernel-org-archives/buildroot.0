From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jan 2017 11:28:54 +1100
Subject: [Buildroot] Fwd: Undelivered Mail Returned to Sender
In-Reply-To: <55b233af-89ae-5e3a-42a5-4d9a79c8f122@oliseo.fr>
References: <20170119135330.BD1852003F1@smtp2-g21.free.fr>
 <55b233af-89ae-5e3a-42a5-4d9a79c8f122@oliseo.fr>
Message-ID: <20170120112854.578246e9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Jan 2017 14:55:37 +0100, Guillaume GARDET - Olis?o wrote:

> I received the following error message while sending emails using
> "git send-email" command as usual.
> 
> It seems that Buildroot list is blocking my emails.

<buildroot@buildroot.org>: host smtp2.osuosl.org[140.211.166.133] said: 550
    5.7.1 Service unavailable; Client host [212.27.42.2] blocked using
    psbl.surriel.rbldns; Listed in PSBL, see
    http://psbl.org/listing?ip=212.27.42.2 (in reply to RCPT TO command)

This typically means your SMTP server is listed in a blacklist, which
the osuosl.org SMTP server uses to decide whether it should accept your
e-mail or not.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
