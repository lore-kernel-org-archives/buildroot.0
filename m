From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 1 May 2016 22:48:15 +0200
Subject: [Buildroot] [PATCH v3 7/9] python-pexpect: fix byte-compilation
	with Python 2
In-Reply-To: <1462133720-409-8-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1462133720-409-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1462133720-409-8-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMM+GQFZ2mz4gxi1n5qhQ-98vHw5q9OspEs96ZpuLYWGsMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, all,

On Sun, May 1, 2016 at 10:15 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> pexpect contains one file, async.py, that is only meant to be used
> with Python 3. Due to this, it fails to byte-compile with Python 2,
> which will become a problem once we make byte-compilation failures
> fatal failures that abort the build.
>
> As suggested by upstream at
> https://github.com/pexpect/pexpect/issues/290, we simply remove the
> problematic file when building with Python 2.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards

-- 
Samuel
