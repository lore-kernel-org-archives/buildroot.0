From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 12 Jul 2011 09:27:33 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.08/debugging-improvements
In-Reply-To: <cover.1310421076.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 11 Jul 2011 23:53:21 +0200")
References: <cover.1310421076.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87sjqchsbe.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> Here is a small set of patches that improves a few things around
 Thomas> debugging.

 Thomas> The main change is that debugging symbols are now enabled by
 Thomas> default. As explained in the commit log, the reasoning is that
 Thomas> debugging symbols in the staging directory are often useful for remote
 Thomas> debugging, and disk space is typically not a problem for the staging
 Thomas> directory, as it remains on the development workstation. Binaries and
 Thomas> libraries for the target are still stripped by default, getting rid of
 Thomas> all debugging symbols.

Next to the size impact (which I agree is not a big problem) there's
also potentially a build time impact. Did you test this?

-- 
Bye, Peter Korsgaard
