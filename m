From: Simon Dawson <spdawson@gmail.com>
Date: Thu, 28 Nov 2013 13:37:23 +0000
Subject: [Buildroot] [PATCHv3 2/5] core: allow external
 Config.in/makefile code to be integrated
In-Reply-To: <CAHXCMMKgWKz_p3ckA1999zxava2TG=SF5qLjqNh7mmygv36Zfg@mail.gmail.com>
References: <1385591508-4174-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1385591508-4174-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHXCMMKgWKz_p3ckA1999zxava2TG=SF5qLjqNh7mmygv36Zfg@mail.gmail.com>
Message-ID: <CAHt8ZCNM0rXaa=V+hST4pUcjiE4hdirpBbrC5wZUJT5MFpnR8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28 November 2013 13:24, Samuel Martin <s.martin49@gmail.com> wrote:
> In this new version of this patch set, the all target and host packages
> entries end up under the "Target packages" menu.
> In my use of this feature, I also have a couple of host tools to integrate.
> So, how about having adding the following source line in
> package/Config.in.host:
> ---
> source "$BR2_EXTERNAL/package/Config.in.host"
> ---
> Of course, this requires to add an empty
> support/dummy-external/package/Config.in.host file.

That would also apply for my expected use of the feature.
