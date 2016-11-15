From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 14 Nov 2016 16:31:44 -0800
Subject: [Buildroot] [PATCH] package/gcc: backport xtensa trap pattern
	for 5.x
In-Reply-To: <20161114225553.0adf1094@free-electrons.com>
References: <1479117941-14895-1-git-send-email-jcmvbkbc@gmail.com>
 <20161114225553.0adf1094@free-electrons.com>
Message-ID: <CAMo8BfLaOH4tomBQRARmWJtMY+B02dEia4ZE4AW1BvcxFaCarA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Nov 14, 2016 at 1:55 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Applied to master, thanks. However, I'm wondering if this backport
> should also be done on gcc versions earlier than 5.x. Could you clarify
> this point?

I haven't seen that issue with earlier gcc versions, it only started showing
up with gcc-5.x.

-- 
Thanks.
-- Max
