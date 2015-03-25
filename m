From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Mar 2015 10:21:20 -0300
Subject: [Buildroot] [Bug-readline] IPython/readline segfaults
In-Reply-To: <5512940B.60808@vu.nl>
References: <55116D12.1000106@vu.nl> <5511B114.60704@case.edu>
 <20150325003203.GL10761@vapier> <5512940B.60808@vu.nl>
Message-ID: <5512B650.1020006@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/25/2015 07:55 AM, ir. Tjeerd Pinkert wrote:

> Thanks, indeed, buildroot 2015.02 has 6.3 with no patches, although it
> downloads the latest tar file. I'm trying to see if patching helps.

I've sent a patch to bump it to patchlevel 8 after the 2015.02 release
for another bug in commit b817e8c58117402561a61c0d749337f415c9c985
(bash-related).
So it'll be part of the 2015.05 release, or if you're in a rush just
apply that patch to your tree.
Regards.
