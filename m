From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Dec 2011 13:28:16 +0100
Subject: [Buildroot] connman dowload failure
In-Reply-To: <87wra2t1q6.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
 of "Mon, 12 Dec 2011 13:26:41 +0100")
References: <20111212120653.GF4531@sapphire.tkos.co.il>
 <87wra2t1q6.fsf@macbook.be.48ers.dk>
Message-ID: <87sjkqt1nj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

Hi,

 Peter> This is caused by cf71111b99ab951 (Cleanup the VCS commands
 Peter> configuration). The BR2_GIT variable changed from "git clone" to just
 Peter> "git". If you change that in your .config it should work again.

This breakage is indeed a bit unfortunate. For this (and other) reason
it is a good idea to work with defconfig files which only contain the
non-default settings (make savedefconfig).

-- 
Bye, Peter Korsgaard
