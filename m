From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Mar 2016 09:15:39 +0100
Subject: [Buildroot] [PATCH] pkgconf: Add a symlink to the
	GNU_TARGET_NAME-pkg-config
In-Reply-To: <20160301091403.2b7ce2fc@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 1 Mar 2016 09:14:03 +0100")
References: <1456770170-6326-1-git-send-email-jer@airfi.aero>
 <u7ieqcx9kv.ln2@ID-313208.user.individual.net>
 <20160229213520.2b6e6ee7@free-electrons.com>
 <87y4a3m7v5.fsf@dell.be.48ers.dk>
 <20160301091403.2b7ce2fc@free-electrons.com>
Message-ID: <87twkqmx5g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> On the other hand, the situations where you add it to the path are
 >> often where you _DO_ want to cross compile.

 > Indeed, but you often end up doing both cross-compilation and native
 > compilation, and it's pretty easy to get confused by a pkg-config
 > returning absurd values.

Sure, but you would get similary confused if you ended up using the
host pkg-config when cross compiling.

-- 
Venlig hilsen,
Peter Korsgaard 
