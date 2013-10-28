From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 28 Oct 2013 17:28:41 +0100
Subject: [Buildroot] [PATCH 3/3] alsamixergui: needs mmu
In-Reply-To: <1382914459-30545-3-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sun, 27 Oct 2013 19:54:19 -0300")
References: <1382914459-30545-1-git-send-email-gustavo@zacarias.com.ar>
 <1382914459-30545-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8738nls6km.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Because of the new fl_open_uri() function since the fltk bump using
 > fork().

Committed, thanks.

-- 
Bye, Peter Korsgaard
