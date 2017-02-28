From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Feb 2017 23:42:16 +0100
Subject: [Buildroot] Ethernet not working with imx6ulevk
In-Reply-To: <CAKkGsYLpW+bU-SihBgRFgyi4cmzJhgah1ZDpjQf0m2ksEmKP_A@mail.gmail.com>
References: <CAKkGsYK+WPvgH-SQ9L_cbBkjCOOXK9YE4ty6L5wQDhJOmYR==Q@mail.gmail.com>
 <CAKkGsYLpW+bU-SihBgRFgyi4cmzJhgah1ZDpjQf0m2ksEmKP_A@mail.gmail.com>
Message-ID: <f974facb-71d8-5498-cfc5-df451a58d27a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-02-17 16:40, Taceant Omnes wrote:
> On 23 February 2017 at 14:30, Taceant Omnes <taceant@gmail.com> wrote:
>> Hi all,
>>
>> Has anybody got Ethernet working with imx6ulevk?
> 
> Yes.
> 
> Here is how to get Ethernet working with imx6ulevk with
> buildroot-2016.11.2 (as well as with the buildroot git master at the
> time of writing this email).
> 
> 1. Download the attachment (zipped patch file) listed towards the end
> of this page: https://community.nxp.com/docs/DOC-333163
> 2. Unzip the patch file to some folder.
> 3. 'make nconfig' to set BR2_LINUX_KERNEL_PATCH to the full path of
> the patch file.
> 4. make

 Note that this patch is apparently included in rel_imx_4.1.15_2.0.1_ga. So, can
you update configs/freescale_imx6ulevk_defconfig to 2.0.1, verify that it works,
and send a patch to Buildroot?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
