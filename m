From: clshotwe at rockwellcollins.com <clshotwe@rockwellcollins.com>
Date: Mon, 28 Apr 2014 09:05:32 -0500
Subject: [Buildroot] Patchwork cleanup #9: triaging proposal
In-Reply-To: <CAAXf6LW5GPZ_vegt_jO=xr0e5Qfzjt4Uq7yye6jF3si6qyycBQ@mail.gmail.com>
References: <CAAXf6LW5GPZ_vegt_jO=xr0e5Qfzjt4Uq7yye6jF3si6qyycBQ@mail.gmail.com>
Message-ID: <OFAD09C70D.50D5D3F4-ON86257CC8.004D6935-86257CC8.004D6938@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

>[RFC] core: Download all package sources
>Clayton Shotwell <clshotwe@rockwellcollins.com>
>http://patchwork.ozlabs.org/patch/288224
>
>C unsure: there was some debate as to this patch is the right way to
>proceed, or whether the buildroot mirror should contain more
>packages,
>or provide a way to create a local buildroot mirror.

I would like to drop this patch. I will have to come up with
another approach to cover all of the corner cases of downloading
the different versions of the packages.

Thanks,
Clayton
