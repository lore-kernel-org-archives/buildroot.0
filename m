From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 4 Jan 2014 17:20:17 +0100
Subject: [Buildroot] [RFC PATCH 0/2] gitorious helper
In-Reply-To: <1387988339-17460-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1387988339-17460-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <CAAXf6LVLcn4iPgrMXXTjyosSfczTTCLqJsSTv9M5VUfpjR3RJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexandre,

On Wed, Dec 25, 2013 at 5:18 PM, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:
> The following patches introduce a gitroious helper to download tarballs for
> gitorious. I currently see two shortcomings:
>  - the tarball URL is https://gitorious.org/<project>/<repo>/archive/<version>.tar.gz
>    so the downloaded tarball doesn't have any name appart from <version>.tar.gz
>  - It needs two separate functions for target and host packages.
>
> Alexandre Belloni (2):
>   infra: introduce gitorious helper function
>   packages: use gitorious helper when applicable

Just a quick note: I'm going to review this (hopefully soon)...

Best regards,
Thomas
