From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Oct 2020 21:28:48 +0200
Subject: [Buildroot] [PATCH-2020.02.x] package/docker-containerd:
 security bump to version 1.2.14
In-Reply-To: <20201016193428.25207-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 16 Oct 2020 21:34:27 +0200")
References: <20201016193428.25207-1-peter@korsgaard.com>
Message-ID: <87y2k3jpu7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > - CVE-2020-15157: containerd v1.2.x can be coerced into leaking credentials
 >   during image pull

 > For details, see the advisory:
 > https://github.com/containerd/containerd/security/advisories/GHSA-742w-89gc-8m9c

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
