From: renxuefeng <renxf_maillist@126.com>
Date: Tue, 10 Oct 2006 18:55:23 +0800
Subject: [Buildroot] How can i compile bash3.1 with uclibc
Message-ID: <452B7C1B.1020809@126.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

i met a problem When i build buildroot with uclibc.
while compiling the bash3.1, it showed some error:

nojobs.o: In function `make_child':
nojobs.c:(.text+0x464): undefined reference to `fork'

I thought this is because the uclibc didnot support the fork function
under the armnommu platform
but how can i using bash under uclibc.
does anybody have some patch for this problem.
