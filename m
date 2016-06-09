From: Martin Bark <martin@barkynet.com>
Date: Thu, 9 Jun 2016 09:49:58 +0100
Subject: [Buildroot] [PATCH 2/2] package/nodejs: bump version to 0.10.45
In-Reply-To: <20160608234429.6875d0a3@free-electrons.com>
References: <1462803501-15901-1-git-send-email-martin@barkynet.com>
 <1462803501-15901-2-git-send-email-martin@barkynet.com>
 <20160608234429.6875d0a3@free-electrons.com>
Message-ID: <CAFGQKxcfoAfYSgD+TBiXco8mwfQr2-3xRoj4HVZgS-_JtfeFzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On 8 June 2016 at 22:44, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon,  9 May 2016 15:18:21 +0100, Martin Bark wrote:
>> See https://nodejs.org/en/blog/release/v0.10.45/
>>
>> Signed-off-by: Martin Bark <martin@barkynet.com>
>
> I am not sure if it is a fall-out of the 0.10.45 bump, of the more
> recent CONF_OPTS changes, but we have a build failure:
>
>    http://autobuild.buildroot.net/results/932/932e4ec24623592255f234a098f7a90ef2ad8063/build-end.log
>
> Could you have a look?

I just submitted a patch which should fix this, see
http://patchwork.ozlabs.org/patch/632681/

Thanks

Martin

>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
