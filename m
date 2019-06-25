From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Jun 2019 22:55:03 +0200
Subject: [Buildroot] [Bug 11776] New: qt5webengine 5.12.2 build failed
 with arm toolchain and linaro toolchain
In-Reply-To: <CAOgXH4cdtGJb494PE0aYKmuVyqBkztK920S3ks4y4L2T_2jShg@mail.gmail.com>
References: <bug-11776-163@https.bugs.busybox.net/>
 <CAOgXH4fdUqmL=s1t1wu7eBxwP7mKEKWv5p2ez7uoD7oH7V=TmA@mail.gmail.com>
 <02804c6d-653e-15da-ecf7-2c770ecb8b1f@230ruedubac.fr>
 <CAOgXH4dUVJziNh756o-6VLkVVaQrDaLcw_tjWa5Pd9GNtO-Rug@mail.gmail.com>
 <03545c68-3409-aad6-15a3-0e7de8cbff78@230ruedubac.fr>
 <CAOgXH4fTF-m_KqGocZz7p_Mfv5Nq+wNnJv3n3WjSuaVALRZOAg@mail.gmail.com>
 <CAOgXH4cgXYXgRL3WVAQfmpLBTUKBhS7qm8JxyiOp+GdcEAHHnw@mail.gmail.com>
 <CAOgXH4csPRQ=a446bUhofT52y6MsGVhRDUu5T3mjttp9T_MMOw@mail.gmail.com>
 <CAOgXH4cdtGJb494PE0aYKmuVyqBkztK920S3ks4y4L2T_2jShg@mail.gmail.com>
Message-ID: <f58bb25a-ca9c-96b8-bf22-874745e47eab@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22/06/2019 20:48, Nathan Ford wrote:
> It is very possible this has been fixed in qt 5.13.0.
> 
> Here is the chromium fix I believe:
> https://chromium.googlesource.com/chromium/src/+/a8c8396fd20d98666d517c45b358c63736e345ef%5E%21/#F0

 Could you test if that fixes it for you, and if yes, send it as a patch to the
Buildroot mailing list?

 Qt 5.13.0 indeed includes this change.

 Regards,
 Arnout

[snip]
