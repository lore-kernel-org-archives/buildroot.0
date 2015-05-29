From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Fri, 29 May 2015 12:41:26 -0500
Subject: [Buildroot] [PATCH v6 06/22] refpolicy: new package
In-Reply-To: <1432765046-1223-7-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1432765046-1223-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1432765046-1223-7-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <CANn-YGRQyHEkQQHrTW2OZt6D=iayk62Mx5W1zA+561z8CvWvSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Everyone,

> diff --git a/package/refpolicy/0001-Fix-awk-references-to-use-variable.patch b/package/refpolicy/0001-Fix-awk-references-to-use-variable.patch
> new file mode 100644
> index 0000000..8236fa2
> --- /dev/null
> +++ b/package/refpolicy/0001-Fix-awk-references-to-use-variable.patch

After running some tests, it looks like I am going to have to move
this patch into a 20131204 folder to ensure the patch does not get
applied when the custom git repo option is enabled. I will get this
fixed for v7 of the patch set.

Thanks,
Clayton

Clayton Shotwell
Senior Software Engineer, Rockwell Collins
clayton.shotwell at rockwellcollins.com
