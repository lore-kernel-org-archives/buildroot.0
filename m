From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 18 Dec 2017 15:56:27 +0100
Subject: [Buildroot] [PATCH 1/1] utils/scanpypi: increase error message
 verbosity
In-Reply-To: <20171218151900.208b1725@windsurf>
References: <20171218140016.13774-1-alexey.roslyakov@gmail.com>
 <20171218151900.208b1725@windsurf>
Message-ID: <CAGm1_kuo+SaPA-ANChKrJfXS4EojV_PBVZkb20CumOxTNBHEEw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 18, 2017 at 3:19 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 18 Dec 2017 21:00:16 +0700, Alexey Roslyakov wrote:
>> When package installation fails it is good to know what happened.
>>
>> Signed-off-by: Alexey Roslyakov <alexey.roslyakov@gmail.com>
>> ---
>>  utils/scanpypi | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> Applied to master, thanks.

@Alexey do you have more scanpypi patches in the queue? I've reworked
the license type detection [1]. I'd also like to add licence file
checksum to the *.hash file creation.

[1] http://patchwork.ozlabs.org/patch/837807/

Yegor
