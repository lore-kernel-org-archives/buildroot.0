From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 May 2018 21:46:06 +0200
Subject: [Buildroot] [PATCH] git: security bump to version 2.16.4
In-Reply-To: <5fabe2e591bd4f1a6932850641f47e214c8cd667.1527615519.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 29 May 2018 20:38:39 +0300")
References: <5fabe2e591bd4f1a6932850641f47e214c8cd667.1527615519.git.baruch@tkos.co.il>
Message-ID: <87in76454x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Forward port of security fixes from the 2.13.7 release. The 2.13.7
 > release notes say this:

 >  * Submodule "names" come from the untrusted .gitmodules file, but we
 >    blindly append them to $GIT_DIR/modules to create our on-disk repo
 >    paths. This means you can do bad things by putting "../" into the
 >    name. We now enforce some rules for submodule names which will cause
 >    Git to ignore these malicious names (CVE-2018-11235).

 >    Credit for finding this vulnerability and the proof of concept from
 >    which the test script was adapted goes to Etienne Stalmans.

 >  * It was possible to trick the code that sanity-checks paths on NTFS
 >    into reading random piece of memory (CVE-2018-11233).

 > Cc: Matt Weber <matthew.weber@rockwellcollins.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
