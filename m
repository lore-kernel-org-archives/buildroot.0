From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Dec 2020 09:34:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/mutt: fix CVE-2020-28896
In-Reply-To: <20201221104224.57712-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 21 Dec 2020 11:42:24 +0100")
References: <20201221104224.57712-1-fontaine.fabrice@gmail.com>
Message-ID: <87czyzfvq8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Mutt before 2.0.2 and NeoMutt before 2020-11-20 did not ensure that
 > $ssl_force_tls was processed if an IMAP server's initial server response
 > was invalid. The connection was not properly closed, and the code could
 > continue attempting to authenticate. This could result in authentication
 > credentials being exposed on an unencrypted connection, or to a
 > machine-in-the-middle.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.08.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
