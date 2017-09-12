From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Sep 2017 22:01:35 +0200
Subject: [Buildroot] [PATCH v2] lirc-tools: bump to version 0.10.1
In-Reply-To: <dba44a833d6e2e6bfa081c069ca3019255724179.1505219518.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 12 Sep 2017 15:31:58 +0300")
References: <dba44a833d6e2e6bfa081c069ca3019255724179.1505219518.git.baruch@tkos.co.il>
Message-ID: <87lglj7kkg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Drop upstream patch.
 > Add an upstream patch fixing build without python.

 > Add two more patches (one of them upstream) fixing cross compile of the
 > python client library.

 > Enable devinput and uinput unconditionally to suppress non cross compile
 > compatible host checks.

 > Set DEVINPUT_HEADER to target header of input events to avoid use of
 > host header.

 > Add python3 as optional dependency.

 > Cc: Rhys Williams <github@wilberforce.co.nz>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 > v2:
 >   Bump version to 0.10.1
 >   Update the python version detection patch to upstream version
 >   Update upstream status of patches

Committed, thanks.

-- 
Bye, Peter Korsgaard
