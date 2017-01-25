From: Alexey Neyman <stilor@att.net>
Date: Wed, 25 Jan 2017 15:56:06 -0800
Subject: [Buildroot] [PATCH 1/1] ucl: Use -std=iso9899:1990 instead of
 -std=c90
In-Reply-To: <20170126110122.1f420135@free-electrons.com>
References: <20170125192020.27140-1-stilor@att.net>
 <20170126110122.1f420135@free-electrons.com>
Message-ID: <5e956d07-4799-a49b-f813-e92318e1f872@att.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/25/2017 02:01 PM, Thomas Petazzoni wrote:
> Hello,
>
> On Wed, 25 Jan 2017 11:20:20 -0800, Alexey Neyman wrote:
>> The shorter alias, -std=c90, is not known by older versions of GCC.
>> See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=20631.
>>
>> Signed-off-by: Alexey Neyman <stilor@att.net>
> Thanks for the patch. Is this fixing a specific autobuilder issue? In
> which situation have you seen the failure?
Issue observed on a CentOS6.x build machine, which has GCC 4.4. The 
--std=c90 appeared in 4.5.

Regards,
Alexey.
