From: Markus Mayer <mmayer@broadcom.com>
Date: Mon, 17 Jul 2017 10:32:36 -0700
Subject: [Buildroot] [PATCH 1/2] Makefile: don't rely on linux-tools
 being sorted alphabetically
In-Reply-To: <20170717153607.GA3518@scaer>
References: <CAGt4E5txWySKpD0npytd=8yujrcQRQNQXwgYQzGCLdy9hyLTLw@mail.gmail.com>
 <20170716150859.GD30047@scaer> <20170717093700.0ed06d45@windsurf>
 <20170717153607.GA3518@scaer>
Message-ID: <CAGt4E5vnEXseeedGFe0zqZQ32VqPOS93o7iTGVSGw2hgBxLdRg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17 July 2017 at 08:36, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas, Markus, All,
>
> On 2017-07-17 09:37 +0200, Thomas Petazzoni spake thusly:
>> On Sun, 16 Jul 2017 17:08:59 +0200, Yann E. MORIN wrote:
>>
>> > Your position on Markus' (non-)issue?
>> >
>> > Do we keep the code as-is, or do we "fix" it so that it is not
>> > ambiguous?
>> >
>> > I've checked, and make uses strcmp(3) internally, and strcmp() does not
>> > use locales at all; it just compares chars.
>>
>> I don't have a very strong opinion on this. To me, it would be fine to
>> have linux-tools.mk and then the per-tool files called
>> linux-tool-<foo>.mk.in or something like that.
>
> Markus, would you want to rework your patch accordingly? Thanks! :-)

Sure. Will do.

-Markus
