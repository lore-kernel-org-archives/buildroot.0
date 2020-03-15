From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 11:14:15 +0100
Subject: [Buildroot] [PATCH 3/5] package/patch: fix CVE-2018-20969
In-Reply-To: <20200303194703.242362-3-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 3 Mar 2020 20:47:01 +0100")
References: <20200303194703.242362-1-fontaine.fabrice@gmail.com>
 <20200303194703.242362-3-fontaine.fabrice@gmail.com>
Message-ID: <87imj6ncw8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > do_ed_script in pch.c in GNU patch through 2.7.6 does not block strings
 > beginning with a ! character. NOTE: this is the same commit as for
 > CVE-2019-13638, but the ! syntax is specific to ed, and is unrelated to
 > a shell metacharacter.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
