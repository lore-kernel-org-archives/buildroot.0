From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Fri, 23 Aug 2013 00:28:56 -0300
Subject: [Buildroot] Change in Qt5 download URLs
In-Reply-To: <20130818195614.2b509547@skate>
References: <20130818195614.2b509547@skate>
Message-ID: <CAExDhva8BJPU_KwAXz67w58hd61_c0nQDj6QKEsOLhZuPgYKyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

      Don't know if your message caught the attention of the ppl
responsible in the interest mailing list, so I would suggest resending
it to releasing at qt-project.org and development at qt-project.org, which
are more suited.

      See: http://lists.qt-project.org/pipermail/development/2013-August/012694.html

Kind Regards,
     Thiago A. Correa

On Sun, Aug 18, 2013 at 2:56 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> The download URLs for the Qt5 submodules tarballs have recently
> changed, which is quite annoying for embedded Linux build systems.
>
> But what's even more annoying is that the new organization of files
> adopted in http://download.qt-project.org/ seems to imply that the most
> recent version of Qt is available in
> http://download.qt-project.org/official_releases/qt/, and then, once a
> newer Qt release is shipped, the older one gets moved to
> http://download.qt-project.org/archive/qt/.
>
> This is really annoying for embedded Linux build systems: they have
> recipes to help people cross-compile many libraries/applications to
> create an embedded Linux system, and therefore they contain the URL of
> upstream tarballs of source code. Moving tarballs around after a
> release has been made breaks the recipes of all those build systems.
>
> Would it be possible for the Qt project to adopt a file organization
> that does not move tarballs once a release has been made?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
