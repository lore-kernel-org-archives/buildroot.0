From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 1 May 2016 22:46:18 +0200
Subject: [Buildroot] [PATCH v3 4/9] python-crossbar: fix
	byte-compilation of .pyc files
In-Reply-To: <1462133720-409-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1462133720-409-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1462133720-409-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMM+PmA=FYUwsm5Si7LNhXL6qEM=UpJLJ88wVg0m0osnMUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, all,

On Sun, May 1, 2016 at 10:15 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> For its continuous integration tests, python-crossbar includes one .py
> file that intentionally has a syntax error. Until now, this wasn't
> causing any problem, but with the introduction of a Python
> byte-compilation process that errors out when there is a failure, it
> is going to become a problem.
>
> We simply add a patch that removes the syntax error, as we don't care
> about it in the context of Buildroot. The problem has been reported
> upstream to see if a better fix is possible.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
