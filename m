From: Ed Spiridonov <edo.rus@gmail.com>
Date: Sun, 26 Jul 2020 15:01:06 +0300
Subject: [Buildroot] [PATCH] package/openvpn: add option to use mbed TLS
 instead of OpenSSL
In-Reply-To: <CAEyMn7YVKNrXVFXu0oS5J6QyVPrT9KF8zHrw4BnYcLKjrSZyFg@mail.gmail.com>
References: <20200511223108.4184-1-edo.rus@gmail.com>
 <CACm0Nn1Fs9KfqWvEMSVXgCXePOViXXBW1TfNziL_56hvzWfs_w@mail.gmail.com>
 <CAEyMn7YVKNrXVFXu0oS5J6QyVPrT9KF8zHrw4BnYcLKjrSZyFg@mail.gmail.com>
Message-ID: <CACm0Nn0oDgVdivDG+E1Ledm6ur3A7G4Jp=YTu0N4tdj0kbAayw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, May 15, 2020 at 10:17 PM Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> Hi Ed,
>> > About 2 Mb of uncompressed image size can be saved by replacing
>> > OpenSSL with mbed TLS.
>>
>> Is anybody interested in this patch?
>> I'm going to publish another patch to make some features optional
>> (server side, multihome, etc), but I guess it will be ignored like
>
> I think the maintainers are busy preparing the upcoming release. And on the other hand the backlog [1] is full with more than 400 pending patches.
>
> So please be patient ;-/

The situation doesn't seem to be improving. Now there are 500+ pending patches.
