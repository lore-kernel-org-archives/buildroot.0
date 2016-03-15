From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 23:16:43 +0100
Subject: [Buildroot] [V3 1/2] scancpan: handle recommended dependencies
	as optional packages
In-Reply-To: <1457890649-4838-1-git-send-email-francois.perrad@gadz.org>
 (Francois Perrad's message of "Sun, 13 Mar 2016 18:37:28 +0100")
References: <1457890649-4838-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <878u1j75f8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Currently, without the flag -recommend, scancpan takes as dependency
 > only one which has the relationship "requires"; this mode works fine.
 > And, with the flag -recommend, scancpan takes all ones (ie. with
 > relationship "requires" or "recommends") in the same way; this mode
 > never works fine, because it is too simplistic.

 > With this commit, the "not required" dependencies are handled as
 > optional BR package or skipped if a cyclic dependency is detected.

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
