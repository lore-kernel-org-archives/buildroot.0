From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 16 Apr 2015 14:29:42 +0200
Subject: [Buildroot] how to point at a local archive of S/W tarballs?
In-Reply-To: <alpine.LFD.2.11.1504160820540.17663@localhost>
References: <alpine.LFD.2.11.1504160820540.17663@localhost>
Message-ID: <CAHXCMMKL_0tT08zgSgHhC9OVVJiTUdYe6USEasqY5PqygkPwVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Robert,

On Thu, Apr 16, 2015 at 2:21 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   [apologies if you've seen this before -- i posted it yesterday but
> it doesn't seem to show up in the ML archives.]
>
>   if i'm starting a new build, how can i take advantage of the
> gigabytes of S/W tarballs i've collected for doing OE/yocto project
> builds?
>
>   i want to set the equivalent of a local mirror -- would i set a
> value in the "Primary download site" config option, with the format
> "file:///pathname/to/all/my/tarballs"?

You certainly want to set BR2_DL_DIR [1].


[1] http://nightly.buildroot.org/#env-vars

Regards,

-- 
Samuel
