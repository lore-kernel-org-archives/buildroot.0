From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 15:08:58 +0200
Subject: [Buildroot] [PATCH] libusb-compat: fix a build issue with
	undefined PATH_MAX
In-Reply-To: <CAMRc=Me7p+5rw2tUWK1vkgrm0YPL-=swtSE87c60t3dOSvUOyQ@mail.gmail.com>
 (Bartosz Golaszewski's message of "Mon, 3 Jul 2017 18:50:35 +0200")
References: <1499091412-26839-1-git-send-email-brgl@bgdev.pl>
 <8b198702-d118-0dc0-fe5b-7f56d5145c47@mind.be>
 <2c1faeab-92de-d158-442e-8ee89965d4cc@mind.be>
 <CAMRc=Me7p+5rw2tUWK1vkgrm0YPL-=swtSE87c60t3dOSvUOyQ@mail.gmail.com>
Message-ID: <87h8y8bml1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bartosz" == Bartosz Golaszewski <brgl@bgdev.pl> writes:

Hi,

 >> OK so I investigated a little more, and it turns out that -std=c99 is the
 >> culprit. And apparently people on the 'net are advising to use linux/limits.h to
 >> get at PATH_MAX. So perhaps this is the right approach after all.
 >> 
 >> What's the upstream status of this patch?

 > Submitted, no answer yet.

Out of interest, where did you submit it? I don't seem to find a pull
request or a patch on the libusb-devel list?

-- 
Bye, Peter Korsgaard
