From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 2 Jun 2017 23:00:34 +0200
Subject: [Buildroot] [PATCH/next 1/2] package/gettext: update wint_t.m4
 from gnulib
In-Reply-To: <20170528161257.4840e1c9@free-electrons.com>
References: <20170525215647.10315-1-bernd.kuhls@t-online.de>
 <20170528161257.4840e1c9@free-electrons.com>
Message-ID: <c79c6866-3c43-6764-0725-7aaa32a48e91@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd, Thomas,

Le 28/05/2017 ? 16:12, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Thu, 25 May 2017 23:56:46 +0200, Bernd Kuhls wrote:
>> Needed for coreutils bump to 8.27
>>
>> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>> ---
>>  .../gettext/0002-Update-after-gnulib-changed.patch | 86 ++++++++++++++++++++++
>>  1 file changed, 86 insertions(+)
>>  create mode 100644 package/gettext/0002-Update-after-gnulib-changed.patch
> 
> I've applied both patches to next. However, what would be nice is to
> submit upstream the coreutils patch. Once upstreamed, we will be able
> to stop autoreconfiguring coreutils, which would be a better solution.
> 
> Of course, in the mean time, gettext will have probably released a new
> version containing the win_t fix, but upstreaming our coreutils patch
> would nonetheless be a good thing.

This patch modify gettext-runtime/m4/wint_t.m4 without using autoreconf:

GETTEXT_AUTORECONF = YES

See
http://autobuild.buildroot.net/results/bd1/bd186ed437fc23cd4fac92f61bde32f9d530c127/build-end.log

Best regards,
Romain

> 
> Could you look into this?
> 
> Thanks!
> 
> Thomas
> 
