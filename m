From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 12 Jan 2013 22:48:14 +0100
Subject: [Buildroot] [PATCH 20/28] atk: remove unused host variant
In-Reply-To: <fef01e5a74239111bcc590fa096f376fe51cc2ae.1357507764.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 6 Jan 2013 22:29:32 +0100")
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <fef01e5a74239111bcc590fa096f376fe51cc2ae.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <871udq2hup.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The atk package is used as a dependency in the libglade and libgtk2
 Thomas> packages.

 Thomas> The libglade package has no host variant, and does not depend on
 Thomas> host-atk.

 Thomas> The libgtk2 package depends on atk, and has a host variant, but the
 Thomas> host variant of libgtk2 overrides HOST_LIBGTK2_DEPENDENCIES to limit
 Thomas> the number of dependencies, and host-atk is not amongst those
 Thomas> dependencies.

 Thomas> Therefore, host-atk is useless and can be removed.

Committed, thanks.

-- 
Bye, Peter Korsgaard
