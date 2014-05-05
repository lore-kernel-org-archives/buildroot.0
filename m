From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 5 May 2014 09:26:29 +0200
Subject: [Buildroot] Patchwork cleanup #8: triaging proposal
In-Reply-To: <CA+kK6WudQxWu-HndSPvv99XURDfjnyGatNRLhuUnfyQpCDg_NQ@mail.gmail.com>
References: <CA+kK6WudQxWu-HndSPvv99XURDfjnyGatNRLhuUnfyQpCDg_NQ@mail.gmail.com>
Message-ID: <CAAXf6LVJdzXXbWyHanWmLCbW0+Wqs2Y9t9DLjp+MxDXLxH9Uqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marcelo,

On Thu, May 1, 2014 at 8:37 PM, Marcelo Gutierrez <kuyurix@gmail.com> wrote:
> Hi All,
>
>
>> [v9] espeak: new package
>> Arnaud Aujon <arnaud.aujon@gmail.com>
>> http://patchwork.ozlabs.org/patch/284229
>
>
> I've tested this patch on Beaglebone Black, and works great. It would be
> interesting to install mbrola voices,  will offer a more realistic speech.
>
> http://espeak.sourceforge.net/mbrola.html

Could you add a proper 'Tested-by' tag on v10 of the espeak patch?
This helps the maintainer in assessing which patches are good to be integrated.

See also http://nightly.buildroot.org/manual.html#_reviewing_and_testing_patches

Thanks,
Thomas
