From: Richard Genoud <richard.genoud@gmail.com>
Date: Fri, 23 Jan 2015 15:43:10 +0100
Subject: [Buildroot] [PATCH 1/2] dropbear: install start script only if
 it doesn't already exists
In-Reply-To: <20150120172243.79f2cec6@free-electrons.com>
References: <1421753394-32029-1-git-send-email-richard.genoud@gmail.com>
 <20150120172243.79f2cec6@free-electrons.com>
Message-ID: <CACQ1gAh9G7vjvbR+D1fq3-XSxNsrzFin8zN=0nTOCKg+i6tcMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-01-20 17:22 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Richard Genoud,
>
> On Tue, 20 Jan 2015 12:29:53 +0100, Richard Genoud wrote:
>> That way, we can use a different start script in a custom skeleton.
>>
>> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
>> ---
>>  package/dropbear/dropbear.mk | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> Sorry, but we precisely recently removed such conditions, because they
> are not needed.
>
> Don't use a custom skeleton, instead use a post-build script or a
> rootfs overlay. With both of those methods, your custom init script
> will take precedence over the one installed by Buildroot.

Ok, I'll look into the rootfs overlay.

Thanks !
