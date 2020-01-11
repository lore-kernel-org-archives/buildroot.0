From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 11 Jan 2020 17:21:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/opencv3: add protobuf option
In-Reply-To: <20200111171444.49006f09@windsurf>
References: <20200111150143.1253117-1-fontaine.fabrice@gmail.com>
 <20200111171444.49006f09@windsurf>
Message-ID: <CAPi7W80L3R=CJ+jOv8f-JU0hWWQMLNmjKT7Fc5q89Q=uTD2dnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le sam. 11 janv. 2020 ? 17:14, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Sat, 11 Jan 2020 16:01:43 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Currently, protobuf is built unconditionnally since version 3.3.0 and
> > https://github.com/opencv/opencv/commit/1c4c58d1b5b7430463281e8c8072e04245f561b0
>
> If I understand correctly, what you meant is:
>
> Since version 3.3.0 and its commit
> https://github.com/opencv/opencv/commit/1c4c58d1b5b7430463281e8c8072e04245f561b0,
> opencv3 bundles its own copy of protobuf. Instead of using the bundled
> protobuf library, this commit disables building protobuf
> (BUILD_PROTOBUF=OFF) and instead uses the protobuf Buildroot package
> (using the WITH_PROTOBUF=ON/OFF option).
>
> Is that correct ?
Yes, this is correct. I should have take more time in writing this
commit message.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
