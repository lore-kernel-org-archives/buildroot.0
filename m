From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Oct 2016 10:04:59 -0300
Subject: [Buildroot] [PATCH 1/7] libglib2: bump to version 2.50.0
In-Reply-To: <20161009220744.3f41b8f2@free-electrons.com>
References: <1474383696-4045-1-git-send-email-gustavo@zacarias.com.ar>
 <20160921141148.3aedf147@free-electrons.com>
 <20161009220744.3f41b8f2@free-electrons.com>
Message-ID: <7dc3ea74-e874-4b9b-b6e3-2789bf126616@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/10/16 17:07, Thomas Petazzoni wrote:

> Hello,
>
> On Wed, 21 Sep 2016 14:11:48 +0200, Thomas Petazzoni wrote:
>
>> On Tue, 20 Sep 2016 12:01:30 -0300, Gustavo Zacarias wrote:
>>> It now requires util-linux libmount so add the dependency/select.
>>>
>>> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>>
>> With this new version, the crc32 symbol gets defined twice in static
>> linking scenarios. See
>> http://autobuild.buildroot.net/results/c26/c2602f2e9db665d5a1d7cea8f3256099ce34a527/build-end.log
>
> Since this issue has been there for a long time, and caused more than
> 500 autobuilder failures, I've for now reverted the bump of libglib2 to
> 2.50.0.
>
> Could you look into this issue, and submit a new version of libglib2
> patch that doesn't exhibit this problem?
>
> Thanks a lot!
>
> Thomas

Hi.
Hmmm ok... this causes more problems than it solves IMO.
So now what, revert gvfs, glibmm, gtk, gtkmm, wayland, weston, legacy ?
Regards.
