From: Mau Z <zmau1962@gmail.com>
Date: Mon, 6 Jan 2014 19:05:42 +0200
Subject: [Buildroot] How to suspend to RAM (S3) on the target
Message-ID: <CAPFcPTJ8i1o1qoZFpjpV6Un3psR8LORtq4tXnUcMXtagdZU3RQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!,

I have built an image which looks like it's working (buildroot 05-13).
Now, I need to "put it in S3" (i.e suspend to RAM).
I had requested the kernel to allow this feature.

In my Ubuntu station the command is "sudo pm-suspend".
On the target, pm-suspend does not exist.

Any advice as to what is the proper way to Suspend to RAM ?


Thanks
Mau
