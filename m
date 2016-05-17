From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 17 May 2016 23:36:47 +0200
Subject: [Buildroot] [PATCH v4 1/4] python/python3: use
	--no-run-if-empty xargs option
In-Reply-To: <1463519956-5599-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1463519956-5599-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1463519956-5599-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMMLs5GMoPsZ6ooO1Oj+b6pWiY0ozu5B2+=RAaA6N2B8avg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, all,

On Tue, May 17, 2016 at 11:19 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> As suggested by Samuel Martin, this commit adds the option
> --no-run-if-empty xargs option to the "find ... | xargs ..." logic used
> in the python and python3 target-finalize hooks to remove py/pyc/pyo
> files. This ensures that the command doesn't fail if there are no files
> matching the pattern.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
