From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sat, 12 Jul 2014 00:13:19 +0200
Subject: [Buildroot] autobuild-run update
In-Reply-To: <20140711201240.34a2c6c3@free-electrons.com>
References: <20140708232244.39817a4c@free-electrons.com>
 <CAHkwnC9qytLwyvxAJ5Bkfc--1Cmh_Y9PY7Vq20OYYG1ErpRLDw@mail.gmail.com>
 <20140711201240.34a2c6c3@free-electrons.com>
Message-ID: <CAHkwnC-jQgf1NnGu3JrCTz_jtZ+ap_kbAXdEbOck2+gNsbXrcA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 11, 2014 at 8:12 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Fri, 11 Jul 2014 18:36:36 +0200, Fabio Porcedda wrote:
>
>> I'm trying to use it on a Ubuntu 14.04 but it fails in few seconds
>> with this error:
>>
>>  ./autobuild-run --ninstances 2 --njobs 3
>
> [...]
>
>> HTTPError: HTTP Error 404: Not Found
>
> Aah, yes, my bad. I removed the AVR32 toolchain configuration file
> yesterday, but forgot to remove this toolchain from the csv file that
> describes all the available toolchain configurations.
>
> This is now fixed, so the script should work again (and the Free
> Electrons build server should start again doing some builds).

Great, thanks.

BR
-- 
Fabio Porcedda
