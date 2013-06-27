From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 Jun 2013 11:25:52 +0200
Subject: [Buildroot] [PATCH 1/1] pv: bump to version 1.4.6
In-Reply-To: <51CB4D8D.2040202@trzebnica.net> (Jerzy Grzegorek's message of
 "Wed, 26 Jun 2013 22:22:37 +0200")
References: <1372276230-15075-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <51CB48B5.7070308@mind.be> <51CB4D8D.2040202@trzebnica.net>
Message-ID: <87bo6r52hr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jerzy" == Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net> writes:

Hi,

 >> If the new version's build system doesn't define the LD variable
 >> anymore, then this patch is probably not needed anymore either.
 >> 
 >> Can you try to just remove the patch?
 Jerzy> Without this patch build doesn't work.

Ok, but atleast the patch description should change. Rather than doing
that, I simply dropped the patch and instead changed it to pass
LD=$(TARGET_LD) on the make cmdline.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
