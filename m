From: swirsky at gmail.com <swirsky@gmail.com>
Date: Mon, 12 Apr 2021 12:08:00 -0700
Subject: [Buildroot] Missing .pyc files in target filesystem
Message-ID: <003801d72fcf$28780910$79681b30$@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We're not getting python .pyc files for the Python packages in the target
filesystem /usr/lib/python3.8/ and I can't figure out why, despite several
days of looking at this.

 

We're on Buildroot 2020.02.03 and I've tried both

 

        BR2_PACKAGE_PYTHON_PYC_ONLY=y

 

        BR2_PACKAGE_PYTHON_PY_PYC=y

 

in the config. I only see .py files.

 

Any ideas on how to debug this? What's the thing in buildroot that creates
the .pyc files?

 

Thanks!

 

 

 

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210412/f739d2a2/attachment.html>
