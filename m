From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 15 Oct 2013 08:56:30 -0300
Subject: [Buildroot] Ncurses wide support
In-Reply-To: <20131015133626.180de72d@skate>
References: <CAAEAJfCkpC6-ZnpcxYCgTiZN8=QJNY+wZg83Jjyzs8-e7jPkkw@mail.gmail.com>	<525D1693.3010509@zacarias.com.ar>	<CAAEAJfD_YaKXY5cMn9H7DcUe3fyJ8L7wJ+RkmaOy40D0KmSZtw@mail.gmail.com>
 <20131015133626.180de72d@skate>
Message-ID: <525D2D6E.9000108@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/15/2013 08:36 AM, Thomas Petazzoni wrote:

>> Maybe you could explain this in detail? Or draft some ncurses.mk
>> patch for me to take care of it?
>>
>> I know you probably don't care about nano, but it's currently broken
>> because of this ncursesw lack.
> 
> Not sure to follow the original problem. If nano needs ncursesw, why
> don't you enable wchar support in your toolchain so that ncursesw gets
> built?

Because ncurses (upstream) just builds the narrow or wide versions, not
both. Currently we build only the narrow version no matter what.
And IIRC some packages don't expect the wide version even if the
toolchain is WCHAR.
Regards.
