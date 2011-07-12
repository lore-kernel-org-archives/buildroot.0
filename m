From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 12 Jul 2011 22:28:39 +0200
Subject: [Buildroot] [PATCH 2/2] Add new package gnutls
In-Reply-To: <1310391267-19364-2-git-send-email-zonque@gmail.com> (Daniel
 Mack's message of "Mon, 11 Jul 2011 15:34:27 +0200")
References: <1310391267-19364-1-git-send-email-zonque@gmail.com>
 <1310391267-19364-2-git-send-email-zonque@gmail.com>
Message-ID: <87wrfngs5k.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <zonque@gmail.com> writes:

 Daniel> Signed-off-by: Daniel Mack <zonque@gmail.com>

 Daniel>  menu "Networking"
 Daniel> +source "package/gnutls/Config.in"

This should be in the crypto section, otherwise it looks good. I'll fix
that - Committed, thanks.

-- 
Bye, Peter Korsgaard
