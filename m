From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Mar 2011 09:50:47 +0100
Subject: [Buildroot] [PATCH 2/9] alsa-utils : bump to 1.0.24.2
In-Reply-To: <AANLkTimeoXMFvkq2FnsnfEFQXwWzH-R2fUAzmdYrUXUB@mail.gmail.com>
	(Chih-Min Chao's message of "Mon, 14 Mar 2011 12:02:33 +0800")
References: <1299831215-26466-1-git-send-email-cmchao@gmail.com>
	<1299831215-26466-2-git-send-email-cmchao@gmail.com>
	<87lj0i8uui.fsf@macbook.be.48ers.dk>
	<AANLkTimeoXMFvkq2FnsnfEFQXwWzH-R2fUAzmdYrUXUB@mail.gmail.com>
Message-ID: <87aagyhyqg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chih-Min" == Chih-Min Chao <cmchao@gmail.com> writes:

Hi,

 >> I guess we'll need to come up with an emulation for it.

 Chih-Min> replace exp10(x) with   exp(x * ln 10)

 Chih-Min> 10^x = 10 ^(ln e^x) = (e^x)^ln10 = e ^ (x * ln 10)

Ahh yes, thanks. Committed and patch sent upstream.

-- 
Bye, Peter Korsgaard
