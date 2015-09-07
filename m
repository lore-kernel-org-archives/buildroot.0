From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 08 Sep 2015 00:10:57 +0200
Subject: [Buildroot] [PATCH] toolchain-external: finish removal of SH2A
	toolchains
In-Reply-To: <1441661293-1638-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 7 Sep 2015 23:28:13 +0200")
References: <1441661293-1638-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87y4ghhocu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Commit c68c365d2937920df1f2062e4821ebb6d21d195e ("toolchain-external:
 > remove CS sh2 toolchains") removed the definitions of the
 > BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201103 and
 > BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009, but did not actually
 > remove the code that was using those options.

 > So this commit removes the parts of the code that are currently dead
 > due to this: the definition of the prefix of those toolchains, the
 > hashes, and the URLs.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
