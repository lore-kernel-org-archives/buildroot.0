From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 03 Mar 2015 08:03:29 -0300
Subject: [Buildroot] [PATCH] perl: needs host-bison
In-Reply-To: <20150303115952.176deea6@free-electrons.com>
References: <1425378663-2659-1-git-send-email-gustavo@zacarias.com.ar>	<20150303114820.32b71d7b@free-electrons.com>	<54F592F2.80405@zacarias.com.ar>
 <20150303115952.176deea6@free-electrons.com>
Message-ID: <54F59501.5080208@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/03/2015 07:59 AM, Thomas Petazzoni wrote:

>> For TARGET_MAKE_ENV maybe since it's only PATH, for HOST_MAKE_ENV it's
>> not and it'll need extra testing to see that perl's build system doesn't
>> fluke with the extras.
> 
> Worth trying IMO.

Ehmm, i wouldn't want to touch much of the perl package with a 10-foot
pole, it's not my thing any more.
I've just conjured a quick fix to get rid of some redness in the
autobuilders (also it requires me to chroot and i don't like bare
minimal chroots!).

> Because they should be using *_MAKE_ENV :-)

Fair enough.
Regards.
