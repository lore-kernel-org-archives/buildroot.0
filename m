From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 9 Oct 2008 02:21:00 -0300
Subject: [Buildroot] svn commit: trunk/buildroot/package/directfb
In-Reply-To: <1223515552.3276.52.camel@localhost.localdomain>
References: <20081007202927.B2E04F802A@busybox.net>
	<1223515552.3276.52.camel@localhost.localdomain>
Message-ID: <d6cda7730810082221w6019c604occa5158abac583f2@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 8, 2008 at 10:25 PM, Ormund Williams <ormundw@panix.com> wrote:
> On Tue, 2008-10-07 at 13:29 -0700, correa at uclibc.org wrote:
>> Author: correa
>> Date: 2008-10-07 13:29:27 -0700 (Tue, 07 Oct 2008)
>> New Revision: 23621
>>
>> Log:
>> widen options to configure directfb, patch by Micha Nelissen <micha@neli.hopto.org>
>>
>> Modified:
>>    trunk/buildroot/package/directfb/Config.in
>>    trunk/buildroot/package/directfb/directfb.mk
>>
>>
>> Changeset:
>> Modified: trunk/buildroot/package/directfb/Config.in
>> ===================================================================
>> --- trunk/buildroot/package/directfb/Config.in        2008-10-07 17:08:27 UTC (rev 23620)
>> +++ trunk/buildroot/package/directfb/Config.in        2008-10-07 20:29:27 UTC (rev 23621)
>> @@ -1,15 +1,10 @@
> --snip--
>
> I get the following error with this patch:
>
> checking for directfb-csource... no
> configure: error: Could not find a directfb-csource in your PATH
> make: ***
> [/home/ormund/buildroot/buildroot/build_i686/DirectFB-1.2.6/.configured]
> Error 1
>

I have no idea what directfb-csource is.
This just works for me when compiling for AVR32.

I also don't have it on my search path either:
localhost directfb # which directfb-csource
which: no directfb-csource in
(/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin:/usr/i686-pc-linux-gnu/gcc-bin/4.1.2:/usr/kde/4.0/sbin:/usr/kde/4.0/bin)

So It can't be coming from the host. Did it work at all before?
Perhaps it's one of the new options?

Kind Regards,
   Thiago A. Correa
