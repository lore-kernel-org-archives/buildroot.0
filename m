From: cmc2001 <craig.mcfarlane@pri.com.au>
Date: Sun, 14 Mar 2010 23:44:41 -0700 (PDT)
Subject: [Buildroot] Core Files on ARM
In-Reply-To: <27900409.post@talk.nabble.com>
References: <27900409.post@talk.nabble.com>
Message-ID: <27900834.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



cmc2001 wrote:
> 
> Forgive the noob question, but we have a busybox'd target which we've
> configured to produce partial core files when our app crashes.
OK, it was obviously a bigger noob question than I realised.  I realise now
that buildroot sits at the top of the tree, not BusyBox.

Would I be right in saying that the BR2_PTHREAD_DEBUG flag is for debugging
the pthread library, not so much producing better thread info in application
core files?

I didn't run across an obvious setting for enabling complete core files in
Config.in.  Where exactly would such a beast live?  Is there a separate
Config.in for kernel-specific stuff?

cya
Craig
-- 
View this message in context: http://old.nabble.com/Core-Files-on-ARM-tp27900409p27900834.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
