From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Thu, 24 Apr 2014 10:47:33 +0100
Subject: [Buildroot] [PATCH v3] package/zile: add Zile is Lossy Emacs
	editor
In-Reply-To: <20140417221418.5e3939fb@skate>
References: <1397737179-12262-1-git-send-email-alex.bennee@linaro.org>
 <1397737179-12262-2-git-send-email-alex.bennee@linaro.org>
 <20140417221418.5e3939fb@skate>
Message-ID: <87iopzqcsq.fsf@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

> On Thu, 17 Apr 2014 13:19:39 +0100, Alex Benn?e wrote:
>> This is a lightweight Emacs clone useful for embedded systems. I nabbed
>> the help2man disable patch from OpenEmbedded.
<snip>
>
> checking for emacs... /usr/bin/emacs
> checking Emacs version 24.3.50.1 >= 23.1... yes
>
>  => is it normal that it references my host emacs? what is this used
>  for?
>
<snip>

It looks like it uses the host emacs to verify the Zile implemented
"lisp" functions perform like their big brother counterparts. They
shouldn't get called unless buildroot emits a "make check".

-- 
Alex Benn?e
