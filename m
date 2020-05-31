From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 May 2020 23:13:54 +0200
Subject: [Buildroot] [PATCH 2/2] package/dovecot: security bump to
 version 2.3.10.1
In-Reply-To: <20200522135808.312867-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 22 May 2020 15:58:08 +0200")
References: <20200522135808.312867-1-fontaine.fabrice@gmail.com>
 <20200522135808.312867-2-fontaine.fabrice@gmail.com>
Message-ID: <87eeqzkdt9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2020-10957: In Dovecot before 2.3.10.1, unauthenticated
 >   sending of malformed parameters to a NOOP command causes a NULL
 >   Pointer Dereference and crash in submission-login, submission, or
 >   lmtp.
 > - Fix CVE-2020-10958: In Dovecot before 2.3.10.1, a crafted SMTP/LMTP
 >   message triggers an unauthenticated use-after-free bug in
 >   submission-login, submission, or lmtp, and can lead to a crash under
 >   circumstances involving many newlines after a command.
 > - Fix CVE-2020-10967: In Dovecot before 2.3.10.1, remote
 >   unauthenticated attackers can crash the lmtp or submission process by
 >   sending mail with an empty localpart.
 > - Drop first patch (already in version) and so autoreconf
 > - Update indentation in hash file (two spaces)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
