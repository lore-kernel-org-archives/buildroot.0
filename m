From: =?utf-8?Q?Micha=C5=82_Kalbarczyk?= <michal@gamecodehq.com>
Date: Fri, 28 Jun 2019 12:12:39 +0200
Subject: [Buildroot] [Bug 11776] New: qt5webengine 5.12.2 build failed
 with arm toolchain and linaro toolchain
In-Reply-To: <CAOgXH4dADDf_5miE6KZC816dxMa21bEgp6GD5E_W7nUc1WSwcg@mail.gmail.com>
References: <bug-11776-163@https.bugs.busybox.net/>
 <CAOgXH4fdUqmL=s1t1wu7eBxwP7mKEKWv5p2ez7uoD7oH7V=TmA@mail.gmail.com>
 <02804c6d-653e-15da-ecf7-2c770ecb8b1f@230ruedubac.fr>
 <CAOgXH4dUVJziNh756o-6VLkVVaQrDaLcw_tjWa5Pd9GNtO-Rug@mail.gmail.com>
 <03545c68-3409-aad6-15a3-0e7de8cbff78@230ruedubac.fr>
 <CAOgXH4fTF-m_KqGocZz7p_Mfv5Nq+wNnJv3n3WjSuaVALRZOAg@mail.gmail.com>
 <CAOgXH4cgXYXgRL3WVAQfmpLBTUKBhS7qm8JxyiOp+GdcEAHHnw@mail.gmail.com>
 <2DC17E03-794C-4E07-B698-707CE728A10A@gamecodehq.com>
 <CAOgXH4dADDf_5miE6KZC816dxMa21bEgp6GD5E_W7nUc1WSwcg@mail.gmail.com>
Message-ID: <E428B667-87F4-4BF3-8FDD-3E1B74C64554@gamecodehq.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tried gcc 8.3 with the same result. I'm using eglfs, maybe this matter.

BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_SQLITE_SYSTEM=y
BR2_PACKAGE_QT5BASE_LINUXFB=y
BR2_PACKAGE_QT5BASE_DEFAULT_QPA="eglfs"
BR2_PACKAGE_QT5BASE_GIF=y
BR2_PACKAGE_QT5BASE_PNG=y
BR2_PACKAGE_QT5MULTIMEDIA=y
BR2_PACKAGE_QT5WEBENGINE=y

Best regards,
Micha?


> On 27 Jun 2019, at 23:45, Nathan Ford <nford@westpond.com> wrote:
> 
> That looks like a new issue.
> 
> For reference I am successfully building Buildroot 2019.05 with gcc 8.3.0.
> 
> --Nate

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190628/3eb3dc71/attachment.html>
