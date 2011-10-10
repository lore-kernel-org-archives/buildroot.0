From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Oct 2011 09:57:01 +0200
Subject: [Buildroot] [PATCH 8/9] external-toolchain: Slightly optimize
	toolchain extraction
In-Reply-To: <55714318d85fc16e3fa0e34144df2ccffe24c1a2.1318182187.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 9 Oct 2011 19:44:31 +0200")
References: <cover.1318182187.git.thomas.petazzoni@free-electrons.com>
 <cover.1318182187.git.thomas.petazzoni@free-electrons.com>
 <55714318d85fc16e3fa0e34144df2ccffe24c1a2.1318182187.git.thomas.petazzoni@free-electrons.com>
Message-ID: <871uule0tu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Some CodeSourcery toolchains contain a huge number of locales that are
 Thomas> not useful, even though they account for 70-80% of the total toolchain
 Thomas> size. By skipping the extraction of those useless locales, we make the
 Thomas> toolchain extraction process slightly faster, and also make the output
 Thomas> directory size a lot smaller (host/opt/ is 213 MB instead of 1.5 GB
 Thomas> with a 2010.09 ARM CodeSourcery toolchain).

Committed, thanks.

-- 
Bye, Peter Korsgaard
