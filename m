From: Simon Dawson <spdawson@gmail.com>
Date: Tue, 5 Jun 2012 07:36:19 +0100
Subject: [Buildroot] [PATCH resend] owl-linux: new package
In-Reply-To: <4FCD41D7.7010203@mind.be>
References: <1337980041-25675-1-git-send-email-spdawson@gmail.com>
 <4FCD41D7.7010203@mind.be>
Message-ID: <CAHt8ZCPYLbWFykpnhzqUjA0-0jGDOwcXdbozf2BWYfmsGASMSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> ?Won't this patch break the build on pre-3.3 kernels? ?I think there should
> be an #if LINUX_VERSION_CODE < KERNEL_VERSION(3,3,0) around it.

Thanks for the suggestion; will fix and resend.

Simon.
