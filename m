From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Nov 2020 22:56:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/libpam-tacplus: fix
 CVE-2020-27743
In-Reply-To: <20201028082658.47272-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 28 Oct 2020 09:26:58 +0100")
References: <20201028082658.47272-1-fontaine.fabrice@gmail.com>
Message-ID: <87imana0d8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > libtac in pam_tacplus through 1.5.1 lacks a check for a failure of
 > RAND_bytes()/RAND_pseudo_bytes(). This could lead to use of a
 > non-random/predictable session_id.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
