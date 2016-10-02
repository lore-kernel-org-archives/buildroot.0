From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Oct 2016 21:32:37 +0200
Subject: [Buildroot] [PATCH 1/1] efibootmgr: fix reverse dependency from
	efivar
In-Reply-To: <1475435737-11969-1-git-send-email-nunes.erico@gmail.com> (Erico
 Nunes's message of "Sun, 2 Oct 2016 21:15:37 +0200")
References: <1475435737-11969-1-git-send-email-nunes.erico@gmail.com>
Message-ID: <87a8empmwa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Erico" == Erico Nunes <nunes.erico@gmail.com> writes:

 > efivar minimum gcc version dependency changed from 4.7 to 4.9 in the
 > last efivar bump, so this must be reflected in efibootmgr Config.in as
 > well.

 > Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
