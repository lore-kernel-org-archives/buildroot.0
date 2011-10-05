From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Oct 2011 13:58:04 +0200
Subject: [Buildroot] [PATCH] pkg-stats: update grep tests for package
	type
In-Reply-To: <ADE657CA350FB648AAC2C43247A983F001F39DCFE6AF@AUSP01VMBX24.collaborationhost.net>
 (H. Hartley Sweeten's message of "Tue, 4 Oct 2011 18:10:40 -0500")
References: <ADE657CA350FB648AAC2C43247A983F001F39DCFE6AF@AUSP01VMBX24.collaborationhost.net>
Message-ID: <87k48jr6pf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "H" == H Hartley Sweeten <hartleys@visionengravers.com> writes:

 H> Update the grep tests used to determine the package type.
 H> The package name and directory are now worked out magically due to:

 H>  package: add helper functions to get package name and directory magically

 H> Because of this the extra arguments were removed by patches:

 H>  package: remove useless arguments from GENTARGETS
 H>  package: remove useless arguments from AUTOTARGETS
 H>  package: remove useless arguments from CMAKETARGETS

Committed, thanks.

-- 
Bye, Peter Korsgaard
