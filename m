From: Heiko Abraham <heiko.abraham@hella-gutmann.com>
Date: Wed, 12 Jul 2017 08:45:39 +0000
Subject: [Buildroot] BlueZ and Bluetooth-SIG
In-Reply-To: <20170712082820.ppvrxtedrv5kmevt@sapphire.tkos.co.il>
References: <650377CF-0CAE-4DF2-A6A6-9BD91D1E90D7@hella-gutmann.com>
 <20170712082820.ppvrxtedrv5kmevt@sapphire.tkos.co.il>
Message-ID: <388DA871-9164-48EA-B678-5971840B0C53@hella-gutmann.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch

I talk also with the bluez-mailing list, our bt-chip-distributor (u-blox) and our test-lab (7-layer).

As I can see, the problem exists with many LTS linux kernels. I don't know any combination that succeeds the tests.
If I understand the bluez mailing list well, some backports or patches are required.

So, my assumption is, that this patches are useful (or required) for buildroot.


Regards,
Heiko

> Am 12.07.2017 um 10:28 schrieb Baruch Siach <baruch@tkos.co.il>:
>
> Hi Heiko,
>
> On Wed, Jul 12, 2017 at 08:18:19AM +0000, Heiko Abraham wrote:
>> I test different versions of linux-kernels (3.10, 3.12, 3.18 for
>> i.MX5/i.MX6) and BlueZ (4.101, 5.43, 5,45) but all combinations failed with
>> Bluetooth-SIG test.
>> (Problems with eRTM and l2cap_disconnect for RFCOMM profile)
>>
>> My assumption is, that an lot of LTS-kernel/BlueZ combinations are not
>> compliant with Bluetooth-SIG. But that is required for an BT based embedded
>> system.
>> Please note, some targets required an older linux kernel for OpenGL support.
>>
>> Any suggestions, how to get an buildroot build, that compliant with
>> bluetooth-sig?
>
> Is this issue specific to Buildroot?
>
> Does the Bluetooth-SIG compliance test succeeds on other Linux distributions?
>
> baruch
>
> --
>     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


________________________________

--
Hella Gutmann Solutions GmbH * Unternehmensform: Gesellschaft mit beschraenkter Haftung *
Firmensitz: 79241 Ihringen * Eingetragen im Handelsregister: AG Freiburg i.Br., HRB 290194 * Geschaeftsfuehrer: Andreas Habeck * USt-IdNr.: DE142208666
