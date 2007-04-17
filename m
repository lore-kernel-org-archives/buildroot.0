From: Thomas Lundquist <lists@zelow.no>
Date: Tue, 17 Apr 2007 12:16:31 +0200
Subject: [Buildroot] which ipkg?
Message-ID: <20070417101631.GA12039@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi.


I am preparing a patch for building autonomous packages in buildroot and
I have tarballs and "udebs" but I also want ipkg.

The big question is; which ipkg version should I/we go for?
handhelds.org has at least two options, the original shell script based
(ipkg-utils) or a C-based newer one.

The C-based seems to be handheld.orgs preferred but the TODO in the
snapshot source mentions "unstable" and it does not have a binary named "ipkg",
just "ipkg-cl" which makes me something between curious and worried.

The CVS repo has some newer code but no snapshots.

anyone familiar with ipkg that has a suggestion on what I should pick?

(or both, chooseable?)


Thomas.
