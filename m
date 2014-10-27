From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Oct 2014 16:12:00 -0300
Subject: [Buildroot] [PATCH 8/8] system/skeleton: drop lp user from
	shadow
In-Reply-To: <CANxTyt5UQcLUYo7-UTWnYOCPE3eEY7C5GpTSYqokQRpB4GhA7A@mail.gmail.com>
References: <1414433941-5778-1-git-send-email-gustavo@zacarias.com.ar>	<1414433941-5778-8-git-send-email-gustavo@zacarias.com.ar>
 <CANxTyt5UQcLUYo7-UTWnYOCPE3eEY7C5GpTSYqokQRpB4GhA7A@mail.gmail.com>
Message-ID: <544E9900.4020201@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/27/2014 04:08 PM, Danomi Manchego wrote:

> I find that udev-182 logs a warning when the "lp" group isn't defined.
> Is it a "don't care"?

That's on system/skeleton/etc/group and i've kept it, this is just the
shadow copy of the (inexistant) lp user from /etc/passwd.
And udev rules don't concern with the lp user at all anyway.
But since you say udev-182 that means you're using an older BR version
aren't you?
Regards.
