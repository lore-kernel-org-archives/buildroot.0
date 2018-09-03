From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 3 Sep 2018 16:07:36 +0530
Subject: [Buildroot] [PATCH 3/4] configs: bpi-m64: Use Mainline ARM ATF
In-Reply-To: <5ab06b35-1627-5669-6fc8-1f8ecbedabb7@arm.com>
References: <1535963172-6664-1-git-send-email-jagan@amarulasolutions.com>
 <1535963172-6664-3-git-send-email-jagan@amarulasolutions.com>
 <5ab06b35-1627-5669-6fc8-1f8ecbedabb7@arm.com>
Message-ID: <CAMty3ZCuZuE_BVjDna6x_=6NwGRONFaSAA_sfNHRJr5cy4fwtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 3, 2018 at 2:36 PM, Andre Przywara <andre.przywara@arm.com> wrote:
> Hi,
>
> On 03/09/18 09:26, Jagan Teki wrote:
>> Use Mainline ARM ATF for bananapi-m64 board instead
>> Andre's github.
>
> Have you tested it? The mainline ATF is not feature-complete yet, so in
> comparison to the old port you are missing the PMIC setup. This breaks
> power off and, more importantly, Ethernet support in U-Boot. I have some
> code to introduce proper (even better) PMIC support, just didn't come
> around to clean it up and post it.
> Meanwhile I would suggest to stick to the old port - actually this was
> the reason I didn't advertise this more widely yet.

I did the basic sanity, look fine. but anyway will drop based on your inputs.

Jagan.
