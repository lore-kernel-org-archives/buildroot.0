From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 8 Mar 2015 02:39:34 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-03-06
In-Reply-To: <20150307231115.GA2518@tarshish>
References: <20150307073020.C6D511011A8@stock.ovh.net>
 <CAMo8BfJo6EJG4SeU3=ZEBB=9gG+SF9pJ9N0fCHh567o-jpfr5Q@mail.gmail.com>
 <20150307231115.GA2518@tarshish>
Message-ID: <CAMo8BfKYm-p4ETuX==DQbtz_s=4wpuwemfePnGaOz4G2YmsmYQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Sun, Mar 8, 2015 at 2:11 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> On Sat, Mar 07, 2015 at 02:43:29PM +0300, Max Filippov wrote:
>> it's been like that for about a week, two questions:
>> - is anybody looking at it/going to take care of it?
>
> See http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/108702.

Yes, I saw it, and also got reply from Waldemar.

>> - is there any regression policy in the buildroot?
>
> How is this a regression? uClibc-ng is a new package that was not included in
> any released version of Buildroot yet.

I couldn't find any written rule, so am wondering.
It may not be a regression per se, but uClibc-ng became a default libc
for xtensa, and
broken default is arguably a regression.

-- 
Thanks.
-- Max
