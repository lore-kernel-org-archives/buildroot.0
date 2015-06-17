From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Wed, 17 Jun 2015 09:51:49 +0200
Subject: [Buildroot] [PATCH] package/openvmtools: move files up from
	unnecessary subdirectory
In-Reply-To: <CABbD_XBn6opGYeqxsjah05c5CbNGo6u+BJZVKnAeSSy0gFdQrw@mail.gmail.com>
References: <1434526416-62466-1-git-send-email-kaszak@gmail.com>
 <20150617094448.01ac6010@free-electrons.com>
 <CABbD_XBn6opGYeqxsjah05c5CbNGo6u+BJZVKnAeSSy0gFdQrw@mail.gmail.com>
Message-ID: <CABbD_XB=Aaw_9aZASrR0+rk-47AzeQ2_i7VFUcXTQAW0otAo4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


>> Or you could use:
>>
>> OPENVMTOOLS_SUBDIR = open-vm-tools
>>
>>
> I did not know there is such an option.
> Which one solution does the BR community prefer?
>

Also, I assume this variable only tells the build system where to start
configure/make etc,
so all patches also has to be modified, am I right?

BR
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150617/40f6c611/attachment.html>
