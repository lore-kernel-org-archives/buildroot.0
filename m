From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 30 Oct 2012 13:14:28 -0300
Subject: [Buildroot] [PATCH 1/2] php: bump to version 5.3.18
In-Reply-To: <20121030140156.4117a077@skate>
References: <1351599635-21356-1-git-send-email-gustavo@zacarias.com.ar>
 <20121030140156.4117a077@skate>
Message-ID: <508FFCE4.9030802@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/30/12 10:01, Thomas Petazzoni wrote:

> Dear Gustavo Zacarias,
> 
> On Tue, 30 Oct 2012 09:20:34 -0300, Gustavo Zacarias wrote:
>> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>> ---
>>  package/php/Config.in                     |    4 ++
>>  package/php/php-force-cross-compile.patch |   50 -----------------------------
> 
> So you are sure this patch is no longer needed? See the explanation
> below: the problem can only be triggered if the build machine has the
> same architecture as the target machine.

Oh yes, i've tested x86_64->x86_64 besides a "cross" target.
They've dropped all of the cross macros, guess they switched everything
to AC_TRY_LINK and other similar macros.
It's kind of amazing they've fixed this upstream right? :)
Regards.
