From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 20 Mar 2017 16:30:53 -0700
Subject: [Buildroot] [PATCH] uboot-tools: pass empty CFLAGS on
 invocation of libfdt/setup.py
In-Reply-To: <20170320225742.054be334@free-electrons.com>
References: <1489768962-26768-1-git-send-email-jcmvbkbc@gmail.com>
 <20170320225742.054be334@free-electrons.com>
Message-ID: <CAMo8BfLZzoRF0Q4zMRPcmwT0UErD7pGH_boMKrWQ07h09fiykw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, Mar 20, 2017 at 2:57 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> There is still an issue with this:
>
>   http://autobuild.buildroot.net/results/eaf/eaf4e5ffc1b2dc3890c529f9d5a0d7e8b6813500/build-end.log

I can't reproduce it.
The python script makes the compilation super quiet, can we apply something
like the attached patch to see what happens?

-- 
Thanks.
-- Max
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-uboot-tools-make-_libfdt.so-build-verbose.patch
Type: text/x-patch
Size: 1389 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170320/03290926/attachment.bin>
