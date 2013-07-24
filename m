From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 24 Jul 2013 07:53:53 -0300
Subject: [Buildroot] command line editing
In-Reply-To: <20130724073509.GC6323@zuhnb712.ap.bm.net>
References: <20130724035428.GA24420@zuhnb712.ap.bm.net>
 <CAJJ6jxtrgkacVO+uwkZgM+am6G1SFLNNiuVcsBm2BCnswLzE6A@mail.gmail.com>
 <20130724073509.GC6323@zuhnb712.ap.bm.net>
Message-ID: <51EFB241.1000001@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/24/2013 04:35 AM, Woody Wu wrote:

> On Tue, Jul 23, 2013 at 09:21:27PM -0700, Steve Calfee wrote:
>> Research Busybox. It is highly configurable. However it is also a very
>> small replacement for your favorite shell (whatever that is). However,
>> buildroot will allow you to select bash (and others) as your shell.
>>
>> Steve
> 
> Thanks Steve.  But I searched throught the busybox configuration menu,
> did not find how to switch shell. Can you please tell me?

Like Baruch said for netcat, this also applies to shells since there are
many in busybox... enable "Show packages that are also provided by
busybox" and go into the "Shell and utilities" category, which,
surprisingly, contains complete full-blown shells like bash :)
Regards.
