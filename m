From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Wed, 25 Mar 2015 16:20:14 -0500
Subject: [Buildroot] [PATCH v8] package/sysdig: New package
In-Reply-To: <20150325194753.3cf82e93@free-electrons.com>
References: <1427280821-2909-1-git-send-email-angelo.compagnucci@gmail.com>
 <CAMQcK5KooYkSGu9CZ78Z871DALorZK7GsYv39XAjnK=kLa7O1w@mail.gmail.com>
 <CAMQcK5+519qW9bQRgMw1MxdFk4Xu7Ap-NRTtr5aqmHChOkGraQ@mail.gmail.com>
 <20150325194753.3cf82e93@free-electrons.com>
Message-ID: <CAMQcK5+8PT1KpzDG-FRXLd2G2+rOGtMN3tmPWDyadLx+14YJTg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Mar 25, 2015 at 1:47 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Well, it depends. If those dependencies are indeed mandatory (i.e
> sysdig always needs LuaJIT, be it a bundled version or a
> system-provided version), I believe we generally prefer to always use
> the system-generated version. Using bundling version is not really nice
> to make sure that the latest versions of LuaJit/zlib/jsoncpp are used.
>
> So, in general, I think we prefer to use system-provided versions,
> unless using the bundled version is absolutely necessary (tight version
> dependency, specific hacks done, etc.).

Thank you for the clarification! So he is correct in forcing
luajit/zlib/jsoncpp to be build in your target.

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
