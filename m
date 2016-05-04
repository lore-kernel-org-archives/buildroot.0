From: Steve deRosier <derosier@gmail.com>
Date: Wed, 4 May 2016 14:05:38 -0700
Subject: [Buildroot] [PATCH v2 1/1] flatcc: new package
In-Reply-To: <CAHXCMMLQeK=Wka332sFg-h4_g_14-FhXFH0NcTjFkbsJ2aCPjg@mail.gmail.com>
References: <1462145376-1377-1-git-send-email-steve.derosier@lairdtech.com>
 <CAHXCMM+wVwqthUOEh+e3fHDA_=J0FS6FqG2cBF+zhVM0BGVoFQ@mail.gmail.com>
 <CALupW3BnsWbBFZhd+GQe26rtXsg-KZUsxkxupZ_5J88Yb14PeA@mail.gmail.com>
 <CAHXCMMLQeK=Wka332sFg-h4_g_14-FhXFH0NcTjFkbsJ2aCPjg@mail.gmail.com>
Message-ID: <CALupW3A+dCvLr7rhw0LGPQKx82oU4MiNw=6xuuGqhjAeu4xTXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On Wed, May 4, 2016 at 1:53 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> Hi Steve,
[snip]
>
> About the shared+static librairy build support, IMHO, it's better to
> stick to what the upstream does, i.e.:
> - if upstream already offers a support for building static and shared
> libraries at the same time, then use what the upstream offers; fix it
> if needed;
> - otherwise, do not try to do add complex stuff in buildroot (either
> patching the sources, or implementing some package's build-system
> lacks in the Buildroot's *.mk files). We don't usually like carrying
> feature patches (unless they are already merged upstream or about to
> be), and we try hard to keep things as simple as possible in Buildroot
> ;-). So, just build shared libraries in that cases. It won't be the
> first package doing that, nor the last one ;-)

Our emails probably crossed.  Suffice it to say, I agree with you -
simple is better that's my preference anyway. I'll try again after I
iron out some issues upstream on flatcc.

- Steve
