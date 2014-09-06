From: Frank Bergmann <frank@frajasalo.de>
Date: Sat, 06 Sep 2014 23:16:10 +0200
Subject: [Buildroot] [autobuild.buildroot.net] nios2 build results for
 2014-09-05
In-Reply-To: <CAAEAJfAeQhe93q7qZFTP=rbZqTfhqQ5FrcXK9ATGzPAoj8sX0w@mail.gmail.com>
References: <20140906063010.F1253101275@stock.ovh.net>
 <CAAEAJfD4eNUAZF9bNV+tWNghFw-pe5qmeAJoZuzMsbASZuAuVg@mail.gmail.com>
 <XnsA3A0AF1AE9B38berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <CAAEAJfAeQhe93q7qZFTP=rbZqTfhqQ5FrcXK9ATGzPAoj8sX0w@mail.gmail.com>
Message-ID: <540B799A.1000701@frajasalo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06.09.2014, 22:24 Ezequiel Garcia wrote:
> On 6 September 2014 12:12, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
>> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>> wrote in news:CAAEAJfD4eNUAZF9bNV+tWNghFw-
>> pe5qmeAJoZuzMsbASZuAuVg at mail.gmail.com:
>>
>>> Any idea why av_open_input_file and avformat_open_input is not found?
>>
>> Hi,
>>
>> is the current build error still related to this discussion?
>>
>> http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/74623
>
> Well, it seems that patch you sent attempted to fix this same error.
> However, applying your patch over here didn't help.
>
> Ideas welcome!

I guess mentor fixed a number of issues in the toolchain, but
unfortunately not our "beloved" _gp bug :-(

Not sure what to do now. Wait for next release because the current
announce itself as "prerelease" or try to setup our own and fix the
issue ?

But I think the package (and the ones also affected) should be disabled
for Nios2.

Regards,
Frank.
