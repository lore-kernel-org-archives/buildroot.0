From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 28 Oct 2012 11:09:03 +0100
Subject: [Buildroot] [PATCH] sconeserver: fix bluetooth module build
	problem
In-Reply-To: <1351326835-9339-1-git-send-email-spdawson@gmail.com>
References: <1351326835-9339-1-git-send-email-spdawson@gmail.com>
Message-ID: <CAHXCMM+DqQcwwZ7Na=x+4_W1qxwopajQrSvx+XVid7L1SPDHow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/10/27  <spdawson@gmail.com>:
> From: Simon Dawson <spdawson@gmail.com>
>
> This fixes a build problem in the sconeserver bluetooth module, as reported
> by the Buildroot autobuild system:
>
>   http://autobuild.buildroot.net/results/d1133da3f8d74c58fd271e0cab197a1108000e90/build-end.log
>
> The build problem, due to the use of BDADDR_ANY, has been fixed upstream;
> consequently, this patch simply bumps the sconeserver svn revision.
>
> Further details of the underlying problem at the following URL.
>
>   http://stackoverflow.com/questions/9751710/c-c-warning-address-of-temporary-with-bdaddr-any-bluetooth-library
>
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Tested-by: Samuel Martin <s.martin49@gmail.com>
